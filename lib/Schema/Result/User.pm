package Schema::Result::User;
use base qw(DBIx::Class::Core);
use 5.012;
use warnings;
use Database;

__PACKAGE__->table('users');
__PACKAGE__->add_columns(qw(id name password email lastlogin registerdate));
__PACKAGE__->set_primary_key('id');
__PACKAGE__->has_many( polls => 'Schema::Result::Poll' );
__PACKAGE__->has_many( votes => 'Schema::Result::Vote' );

sub check {
    my ( $self, $email, $password ) = @_;

    return 1 if 

    # Fail
    return;
}

1;

