package Didldadldu;

use 5.012;
use warnings;

use base 'Mojolicious';

# This method will run once at server start
sub startup {
    my $self = shift;

    # Routes
    my $r = $self->routes;

    # Normal route to controller
    $r->route('/welcome')->to('example#welcome', id => 1);
}

1;
