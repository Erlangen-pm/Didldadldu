package Data::Schema::Result::Polls;
use base 'DBIx::Class:Core';

__PACKAGE__->table('polls');
__PACKAGE__->add_columns(qw(id text userid code));


1;


