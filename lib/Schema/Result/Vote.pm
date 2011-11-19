package Schema::Result::Vote;
use base 'DBIx::Class::Core';

=head1 Resultset for single votes

tracks votes cast for certain options of a survey by certain users of the survey

=cut

__PACKAGE__->table('vote');

=head1 ATTRIBUTES

both attributes serve as composed primary keys for this result set.

=head2 option_id

foreing key refering to the option

=head2 voter_id

foreign key refering to the voter

=cut

__PACKAGE__->add_columns(qw(option_id voter_id));
__PACKAGE__->set_primary_key(qw(option_id voter_id));

=head1 CONSTRAINS

=head2 option

a vote is always cast for an option by its given option_id.

=cut

__PACKAGE__->belongs_to( option => 'Schema::Result::Option', 'option_id' );

=head2 option

a vote is always cast from a voter by its given voter_id.

=cut

__PACKAGE__->belongs_to( voter  => 'Schema::Result::Voter',  'voter_id'  );

=head1 METHODS

=head2 set( $survey_usercode, $option_position, $voter_name )

set a vote for the voter by her name and the option by its position inside the
survey referenced to by its survey_usercode.

=cut

sub set {
    my  ( $self, $survey_usercode, $option_position, $voter_name ) = @_;
}

=head2 unset( $survey_usercode, $option_position, $voter_name )

delete a vote for the voter by her name and the option by its position inside 
the survey referenced to by its survey_usercode (the data set is deleted in 
the table).

=cut

sub unset {
    my  ( $self, $survey_usercode, $option_position, $voter_name ) = @_;
}

=head2 delete_all_of_survey( $survey_admincode )

delete all votes for a survey referenced by its survey_admincode. used for
deleting complete surveys.

=cut

sub delete_all_of_survey {
    my ( $self, $survey_admincode ) = @_;
}

=head2 delete_all_of_option( $survey_admincode, $option_position )

delete all votes for an option of a survey referenced by its survey_admincode and the
position of the option in the survey. used for deleting options from the survey.

=cut

sub delete_all_of_option {
    my ( $self, $survey_admincode, $option_position ) = @_;
}

=head2 delete_all_of_voter( $survey_admincode, $voter_name )

delete all votes from a voter for a survey referenced by its survey_admincode
and the name of the voter. used when a voter unregisters from the survey.

=cut

sub delete_all_of_voter {
    my ( $self, $survey_usercode, $voter_name ) = @_;
}

1;

