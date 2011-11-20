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

    # Routes
    my $r = $self->routes;

    $r->route('/')->via('get')->to('manage-survey#create_form');
    $r->route('/new')->via('post')->to('manage-survey#create');
    my $admin = $r->route('/:admincode', admincode => qr(\w{32}));
    $admin->via('get')->to('manage-survey#view');
    $admin->route('/modify')->via('get')->to('manage-survey#modify_form');
    $admin->route('/modify')->via('post')->to('manage-survey#modify');
    $admin->route('/deactivate')->to('manage-survey#deactivate');
    $admin->route('/reactivate')->to('manage-survey#reactivate');
    $admin->route('/delete')->to('manage-survey#delete');

    $admin->route('/create_option')->via('get')->to('manage-option#create_form');
    $admin->route('/create_option')->via('post')->to('manage-option#create');
    my $admin_option = $admin->route('/:position', position => qr(\d+));
    $admin_option->route('/modify')->via('get')->to('manage-option#modify_form');
    $admin_option->route('/modify')->via('post')->to('manage-option#modify');
    $admin_option->route('/move/:new_position', new_position => qr(\d+))->to('manage-option#move');
    $admin_option->route('/delete')->to('manage-option#delete');

    my $userview = $r->route('/:usercode', usercode => qr(\w{16}));
    $userview->via('get')->to('survey-voter#view');
    $userview->route('/register')->via('post')->to('survey-voter#register');
    my $voter = $userview->route('/:name', name => qr(\w+));
    $voter->route('/:modify')->via('post')->to('survey-voter#modify');
    $voter->route('/:delete')->via('get')->to('survey-voter#delete');

    my $voter_option = $voter->route('/:position', position => qr(\d+));
    my $cast = $voter_option->route('/set')->via('get')->to('survey-vote#set');
    $cast = $voter_option->route('/unset')->via('get')->to('survey-vote#unset');
}

1;
