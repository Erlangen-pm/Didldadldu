package Schema::Result::Poll;
use base qw(DBIx::Class::Core);
__PACKAGE__->table('polls');
__PACKAGE__->add_columns(qw(id text code));
__PACKAGE__->set_primary_key('id');
__PACKAGE__->has_many(
    options => 'Schema::Result::Option',
    'pollid', { order_by => 'id' }
);

1;

