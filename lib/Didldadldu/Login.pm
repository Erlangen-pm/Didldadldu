package Didldadldu::Login;
use Mojo::Base 'Mojolicious::Controller';

sub check_credentials {
    my ( $self, $email, $password ) = @_;

    return 1 if ( get_schema()->resultset('User')->search( { email => $email, password => $password } ) );

    # Fail
    return;
}

sub login_form {
    my $self = shift;
}

sub login {
    my $self = shift;
}


sub register_form {
    my $self = shift;
}

sub register {
    my $self = shift;
}

sub check_session {
    my $self = shift;
    return 1;
}

1;

