package Data::Result::Option;
use base qw(DBIx::Class::Core);
__PACKAGE__->table('options');
__PACKAGE__->add_columns(qw(id pollid order text));
__PACKAGE__->set_primary_key('id');
__PACKAGE__->belongs_to(poll => 'Data::Result::Poll', 'pollid'

1;

