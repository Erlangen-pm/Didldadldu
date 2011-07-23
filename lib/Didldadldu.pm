package Didldadldu;

use strict;
use warnings;

use base 'Mojolicious';

# This method will run once at server start
sub startup {
    my $self = shift;

    # Routes
    my $r = $self->routes;

    $r->route('/new')->bridge('login#check_credentials')->via('get')
      ->to('manage#createform');
      
    $r->route('/new')->bridge('login#check_credentials')->via('post')
      ->to('manage#create');

    $r->route( '/:id', id => qr/\w+/ )->bridge('view#is_public')->via('get')
      ->to('view#list');

    $r->route( '/:id', id => qr/\w+/ )->bridge('view#is_public')->via('post')
      ->to('view#vote');
}

1;
