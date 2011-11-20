package Schema::Result::Option;
use base 'DBIx::Class::Core';

=head1 Resultset Option

Resultset representing the available options for the surveys.

=cut

__PACKAGE__->table('option');

=head1 ATTRIBUTES

=head2 id

primary key.

=head2 survey_id

foreign key for survey result set.

=head2 position

position of the option inside the survey. will be used for referencing
to the option from outside.

=head2 text

something to read for the voters.

=cut

__PACKAGE__->add_columns(
    id => { data_type => 'bigint', is_nullable => 0, is_auto_increment => 1 },
    survey_id =>
      { data_type => 'bigint', is_foreign_key => 1, is_nullable => 0 },
    position => { data_type => 'integer', is_nullable => 0 },
    text     => { data_type => 'varchar', is_nullable => 0, size => 255 },
);
__PACKAGE__->set_primary_key('id');

=head1 CONSTRAINS

=head2 belongs to survey

survey contain one or many options.

=cut

__PACKAGE__->belongs_to( survey => 'Schema::Result::Survey', 'survey_id' );

=head2 has many votes

there might be votes for that option.

=cut

__PACKAGE__->has_many( votes => 'Schema::Result::Vote', 'voter_id' );

=head1 METHODS
=cut

=head2 create( $survey_admincode, $text )

create a new option with the given text for the survey with the 
given survey_admincode.

=cut

sub create {
    my ( $self, $survey_admincode, $text ) = @_;
}

=head2 admin_view( $survey_admincode, $position )

returns the data of an option by its given survey_admincode and its position 
inside the survey.

=cut

sub admin_view {
    my ( $self, $survey_admincode, $position ) = @_;
    my $data;
    return $data;
}

=head2 user_view( $survey_usercode, $position )

returns the data of an option by its given survey_usercode and its position 
inside the survey.

=cut

sub user_view {
    my ( $self, $survey_usercode, $position ) = @_;
    my $data;
    return $data;
}

=head2 modify( $survey_admincode, $position, $text )

modify the text of the option referenced by the surveys survey_admincode 
and its position inside the survey.

=cut

sub modify {
    my ( $self, $survey_admincode, $position, $text ) = @_;
}

=head2 move( $survey_admincode, $position, $new_position )

moves the option referenced by the surveys survey_admincode and its position 
inside the survey to a new position inside the given survey referenced by 
survey_admincode. the positions of following options will be recalculated.

=cut

sub move {
    my ( $self, $survey_admincode, $position, $new_position ) = @_;
}

=head2 delete( $survey_admincode, $position )

delete the option referenced by the surveys survey_admincode and its position
inside the survey.

=cut

sub delete {
    my ( $self, $survey_admincode, $position ) = @_;
}

=head2 delete_all_of_survey( $survey_admincode )

delete all options of the given survey via the given survey_admincode.
also takes care of deleting the votes for the option.

=cut

sub delete_all_of_survey {
    my ( $self, $survey_admincode ) = @_;
}

=head2 list_voters( $survey_admincode, $position )

list all the actual votes for the option referenced by the surveys 
survey_admincode and its position inside the survey. in the list
1 means, the vote is cast for the option. 0 means, the vote
ist cast against the option. undef means the particular user has not 
yet cast a vote for that option (maybe because the option was just
recently added).

=cut

sub list_voters {
    my ( $self, $survey_admincode, $position ) = @_;
    my $votes;
    return $votes;
}

1;

