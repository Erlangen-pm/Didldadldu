package Didldadldu::View;
use Mojo::Base 'Mojolicious::Controller';
use 5.012;
use warnings;
use utf8;

sub _get_baseinfo {
    my $c       = shift;
    my $code    = $c->param('code');
    my $db      = $c->app->db;
    my $poll    = $db->resultset('Poll')->find( { code => $code } );
    my $options = $poll->search_related('options');
    return $code, $db, $poll, $options;
}

sub show {
    my $c = shift;
    my ( $code, $db, $poll, $options ) = $c->_get_baseinfo;
    $c->stash( poll    => $poll );
    $c->stash( options => $options );
    my %votes = ();
    my $votes = $options->search_related_rs('votes');
    while ( my $v = $votes->next ) {
        $votes{$v->user}{$v->optionid} = 1;
    }
    $c->stash( votes   => \%votes );
    $c->stash( code    => $code );
}

sub cast {
    my $c = shift;
    my ( $code, $db, $poll, $options ) = $c->_get_baseinfo;
    my $v = $c->create_validator();
    $v->field('user')->required(1)->length( 3, 64 );
    my $user = $c->param('user');
    if ( $c->validate($v) ) {
        $options->search_related( 'votes', { user => $user } )->delete;
        while ( my $o = $options->next ) {
            $o->create_related( 'votes', { user => $user } )
              if $c->param( $o->id );
        }
    }
    $c->redirect_to( 'show', code => $code );
}

1;
