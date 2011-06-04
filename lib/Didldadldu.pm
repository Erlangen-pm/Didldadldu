package Didldadldu;

use 5.012;
use warnings;

use Schema;
use base 'Mojolicious';

# This method will run once at server start
sub startup {
    my $self = shift;

    # Routes
    my $r = $self->routes;

    # Normal route to controller
    $r->route('/login')->to('login', id => 1);
}

{
    my $schema;
    sub get_schema {
        return $schema if defined $schema;
        return Schema->connect(config(qw(dsn dbuser dbpass)));
    }
}

{
    my $config;
    sub get_config {
        return $config if defined %config;
        return $config = decode_json( do { local $\; open my $fh, "$FindBin::Bin/../etc/db_config.json" or die; <$fh> } );
    }
    sub config {
        my ( @keys ) = @_;
        my $config = get_config();
        return map { $config->{$_} } @keys;
    }
}

1;
