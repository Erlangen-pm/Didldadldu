package Data::Schema::Result::Votes;
use base 'DBIx::Class::Core';

__PACKAGE__->table('votes');
__PACKAGE__->add_columns(qw(optionid userid vote votetime));
__PACKAGE__->set_primary_key(qw(optionid userid));
__PACKAGE__->belongs_to(option => 'Data::Schema::Result::Options', 'optionid');
__PACKAGE__->belongs_to(user   => 'Data::Schema::Result::Users',   'userid');

1;

