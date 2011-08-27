package Didldadldu::Manage;
use Mojo::Base 'Mojolicious::Controller';

sub create {
    my $self = shift;
    my $question = $self->param('question');
    my @answers  = split /\n/, $self->param('answers');
    $self->app->dbh
    $self->render( template => 'view/list' );
}

sub alter_form {
    my $self = shift;
    my $code = $self->param('code');
    $self->render( template => 'manage/createform' );
}

sub alter {
    my $self = shift;
    $self->render( template => 'view/list' );
}

1;
