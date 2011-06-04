package Didldadldu::Login;
use Mojo::Base 'Mojolicious::Controller';

sub check_credentials {
    my ( $self, $email, $password ) = @_;

    return 1 if ( get_schema()->resultset('User')->search( { email => $email, password => $password } ) );

    # Fail
    return;
}

1;

