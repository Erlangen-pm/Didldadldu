package Didldadldu;

use strict;
use warnings;

use base 'Mojolicious';
use DBI;

my ( $dbh, $config );

sub dbh {
    my $self = shift;
    return $dbh if defined $dbh;
    return $dbh = DBI->connect( $self->config()->{'dsn'} );
}

sub config {
    return $config if defined $config;
    return $config = $_[0]->stash('config');
}

# This method will run once at server start
sub startup {
    my $self = shift;
    $config = $self->plugin('json_config') unless defined $config;

    # Routes
    my $r = $self->routes;

    $r->route('/')->via('get')->to('manage#createform');
    $r->route('/new')->via('get')->to('manage#createform');

    $r->route('/new')->via('post')->to('manage#create');

    $r->route( '/:code', code => qr/\w+/ )->via('get')->to('view#list');

    $r->route( '/:code', code => qr/\w+/ )->via('post')->to('vote#cast');

    $r->route( '/:code/alter', code => qr/\w+/ )->via('get')
      ->to('manage#alterform');

    $r->route( '/:code/alter', code => qr/\w+/ )->via('post')
      ->to('manage#alter');
}

1;
