package Schema::Result::Vote;
use base qw(DBIx::Class::Core);
__PACKAGE__->table('votes');
__PACKAGE__->add_columns(qw(optionid user));
__PACKAGE__->set_primary_key(qw/optionid user/);
__PACKAGE__->belongs_to( option => 'Schema::Result::Option', 'optionid' );

1;

