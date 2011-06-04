package Data::Result::User;
use base qw(DBIx::Class::Core);
__PACKAGE__->table('users');
__PACKAGE__->add_columns(qw(id name password email lastlogin registerdate));
__PACKAGE__->set_primary_key('id');
__PACKAGE__->has_many( polls => 'Data::Result::Poll' );
__PACKAGE__->has_many( votes => 'Data::Result::Vote' );

1;

