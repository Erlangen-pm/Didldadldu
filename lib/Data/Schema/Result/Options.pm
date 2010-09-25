package Data::Schema::Result::Options;
use base 'DBIx::Class::Core';

__PACKAGE__->table('options');
__PACKAGE__->add_columns(qw(id pollid text));
__PACKAGE__->set_primary_key('id');
__PACKAGE__->has_many(votes => 'Data::Schema::Result::Votes', 'optionid'); 
__PACKAGE__->belongs_to(poll => 'Data::Schema::Result::Polls', 'pollid');

1;


