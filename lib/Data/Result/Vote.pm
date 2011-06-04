package Data::Result::Vote;
use base qw(DBIx::Class::Core);
__PACKAGE__->table('votes');
__PACKAGE__->add_columns(qw(id optionid userid username vote votetime));
__PACKAGE__->set_primary_key('id');
__PACKAGE__->belongs_to( option => 'Data::Result::Option', 'optionid' );
__PACKAGE__->belongs_to( user   => 'Data::Result::User',   'userid' );

1;

