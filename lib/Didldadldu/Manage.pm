package Didldadldu::Manage;
use Mojo::Base 'Mojolicious::Controller';
use 5.012;
use warnings;
use utf8;

sub createform {
    $_[0]->stash( code => '', question => '', answers => '' );
}
sub create { $_[0]->_factor() }

sub alterform {
    my $s = shift;
    my $c = $s->param('code');

    my $db = $s->app->db;
    my $p = $db->resultset('Poll')->find( { code => $c } );
    $s->stash( question => $p->text );
    my $options = $p->search_related('options');
    $s->stash( answers => join "\n", map { $_->text } $options->all );
    $s->stash( code => $c );
    $s->render( template => 'manage/createform' );
}
sub alter { $_[0]->_factor( $_[0]->params('code') ) }

sub _factor {
    my ( $s, $c ) = @_;
    my $v = $s->create_validator;
    $v->field('question')->required(1)->length( 10, 255 );
    $v->field('answers')->required(1);

    my $q = $s->param('question');
    my $a = $s->param('answers');

    if ( $s->validate($v) ) {
        $c =
            $c
          ? $s->_update( $c, $q, $a )
          : $s->_insert( $q, $a );

        $s->redirect_to( 'show', code => $c );
    }
    else {
        $s->render( template => 'manage/createform' );
    }
}

sub _insert {
    my ( $s, $q, $a ) = @_;
    my $db = $s->app->db;
    my $c  = $s->_make_code;
    $c = $s->_make_code while $db->resultset('Poll')->count( { code => $c } );
    my $p = $db->resultset('Poll')->create( { code => $c, text => $q } );
    $s->_add_answers($p, $a);
    return $c;
}

sub _update {
    my ( $s, $c, $q, $a ) = @_;
    my $db = $s->app->db;
    my $p = $db->resultset('Poll')->find( { code => $c } );
    $p->search_related('options')->delete;
    $p->text($q);
    $p->update;
    $s->_add_answers($p, $a);
    return $c;
}

sub _add_answers {
    my ( $s, $p, $a ) = @_;
    $p->create_related( 'options', { text => $_ } )
      for map { chomp; $_ } split /\n/, $a;
}

sub _make_code { sprintf '%x', time }

1;
