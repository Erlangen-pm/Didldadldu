package Didldadldu;

use strict;
use warnings;

use base 'Mojolicious';

# This method will run once at server start
sub startup {
    my $self = shift;

    # Routes
    my $r = $self->routes;

    $r->route('register')->via('get')->to('login#registerform');
    $r->route('register')->via('post')->to('login#register');

    $r->route('/login')->via('get')->to('login#loginform');
    $r->route('/login')->bridge('login#check_credentials')->via('post')
      ->to('login#login');

    $r->route('/new')->bridge('login#check_session')->via('get')
      ->to('manage#createform');

    $r->route('/new')->bridge('login#check_session')->via('post')
      ->to('manage#create');

    $r->route( '/:id', id => qr/\w+/ )->bridge('view#is_public')->via('get')
      ->to('view#list');

    $r->route( '/:id', id => qr/\w+/ )->bridge('view#is_public')->via('post')
      ->to('view#vote');
}

1;
