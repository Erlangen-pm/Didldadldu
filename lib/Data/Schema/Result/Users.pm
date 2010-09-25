package Data::Schema::Result::Users;
use base 'DBIx::Class::Core';

__PACKAGE__->table('users');
__PACKAGE__->add_columns(qw(id name password email registerdate lastlogin));
__PACKAGE__->set_primary_key('id');
__PACKAGE__->has_many(polls => 'Data::Schema::Result::Polls', 'userid');
__PACKAGE__->has_many(votes => 'Data::Schema::Result::Votes', 'userid');

1;

