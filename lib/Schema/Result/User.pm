package Schema::Result::User;
use base qw(DBIx::Class::Core);

__PACKAGE__->table('users');
__PACKAGE__->add_columns(qw(id name password email lastlogin registerdate));
__PACKAGE__->set_primary_key('id');
__PACKAGE__->has_many( polls => 'Schema::Result::Poll', 'userid' );
__PACKAGE__->has_many( votes => 'Schema::Result::Vote', 'userid' );

1;

