package Data::Schema::Result::Polls;
use base 'DBIx::Class::Core';

__PACKAGE__->table('polls');
__PACKAGE__->add_columns(qw(id text userid code starttime endtime creationtime));
__PACKAGE__->set_primary_key('id');
__PACKAGE__->has_many(options => 'Data::Schema::Result::Options', 'pollid');
__PACKAGE__->belongs_to(user => 'Data::Schema::Result::Users', 'userid');

1;

