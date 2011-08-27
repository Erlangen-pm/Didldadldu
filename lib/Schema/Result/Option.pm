package Schema::Result::Option;
use base qw(DBIx::Class::Core);
__PACKAGE__->table('options');
__PACKAGE__->add_columns(qw(id pollid text));
__PACKAGE__->set_primary_key('id');
__PACKAGE__->belongs_to( poll => 'Schema::Result::Poll', 'pollid' );
__PACKAGE__->has_many(
    votes => 'Schema::Result::Vote',
    'optionid', { order_by => 'user', group_by => 'user' }
);

1;

