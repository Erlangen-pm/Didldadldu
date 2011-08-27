package Didldadldu;

use 5.012;
use utf8;
use warnings;

use base 'Mojolicious';
use Schema;

# This method will run once at server start
sub startup {
    my $self = shift;
    $self->secret('Mojolicious rocks!');

    my $config = $self->plugin('JSONConfig');

    # Model instance
    my $schema =
      Schema->connect( $config->{dsn}, undef, undef,
        { RaiseError => 1, AutoCommit => 1 } );

    # Helper function returning our model instance
    $self->helper( db => sub { return $schema } );

    $self->plugin(
        'validator' => {
            messages => {
                REQUIRED => 'Dieses Feld wird zwingend benötigt!',
                LENGTH_CONSTRAINT_FAILED =>
                  'Dieses Feld muss zwischen 10 und 255 Zeichen lang sein!'
            }
        }
    );

    # Routes
    my $r = $self->routes;

    $r->route('/')->via('get')->to('manage#createform');
    $r->route('/new')->via('get')->to('manage#createform');

    $r->route('/new')->via('post')->to('manage#create');

    $r->route( '/:code', code => qr/\w+/ )->via('get')->to('view#show')
      ->name('show');

    $r->route( '/:code', code => qr/\w+/ )->via('post')->to('view#cast')
      ->name('cast');

    $r->route( '/alter/:code', code => qr/\w+/ )->via('get')
      ->to('manage#alterform')->name('alter');

    $r->route( '/alter/:code', code => qr/\w+/ )->via('post')
      ->to('manage#alter')->name('update');
}

1;
