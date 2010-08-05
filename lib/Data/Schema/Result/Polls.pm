package Data::Result::Polls;
use base 'DBIx::Class:Core'

__PACKAGE__->table('options');
__PACKAGE__->add_columns(qw(id text userid code));


1;


