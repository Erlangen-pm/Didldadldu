package Schema::Result::Poll;
use base qw(DBIx::Class::Core);
__PACKAGE__->table('polls');
__PACKAGE__->add_columns(qw(id text userid code multi closed starttime endtime creationtime));
__PACKAGE__->set_primary_key('id');
__PACKAGE__->has_many(options=> 'Schema::Result::Option', 'pollid');
__PACKAGE__->belongs_to(user => 'Schema::Result::User', 'userid');

1;

