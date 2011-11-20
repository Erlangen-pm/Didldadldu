package Schema::Result::Voter;
use base 'DBIx::Class::Core';

=head1 Resultset Voters

represents all voters that registered themselves for surveys.

=cut

__PACKAGE__->table('voter');

=head1 ATTRIBUTES

=head2 id

primary key.

=head2 survey_id

foreign key for the survey the voter registered herself.

=head2 name

unique name string of the voter for identifing an voter from the outside.

=head2 email

optional email adress for further notification of the voter.

=head2 registerdate

date of when the voter registered for the survey.

=head2 actiondate

date of the last action applied by the voter (place a vote or revoke a vote).

=cut

__PACKAGE__->add_columns(qw(id survey_id name email registerdate actiondate));
__PACKAGE__->set_primary_key('id');

=head1 CONSTRAINS

=head2 survey

every voter belongs to one survey via the survey_id. for every survey, a voter
needs to register newly, but there will be help via cookies and stuff.

=cut

__PACKAGE__->belongs_to( survey => 'Schema::Result::Survey', 'survey_id' );

=head2 has many votes

the user may vote for zero, one or many options of the corresponding survey.

=cut

__PACKAGE__->has_many( votes => 'Schema::Result::Vote', 'voter_id' );


=head1 METHODS

=head2 register( $survey_usercode, $name, $email )

a user can register for a survey referenced by its survey_usercode and is then
able to cast votes for the options of that survey.

=cut

sub register {
    my ( $self, $survey_usercode, $name, $email ) = @_;
}

=head2 user_view( $survey_usercode, $name )

returns the date for a user referenced by the surveys survey_usercode and
the name of the user.

=cut

sub user_view {
    my ( $self, $survey_usercode, $name ) = @_;
    my $data;
    return $data;
}

=head2 modify( $survey_usercode, $name, $new_name, $new_email )

modifies the attributes of a user identified by its name and the surveys survey_usercode.

=cut

sub modify {
    my ( $self, $survey_usercode, $name, $new_name, $new_email ) = @_;
}

=head2 unregister( $survey_usercode, $name )

deletes a voters identified by its name and the surveys survey_usercode
from the survey. takes care of deleting all of its votes as well.

=cut

sub unregister {
    my ( $self, $survey_usercode, $name ) = @_;
}

=head2 delete_all_of_survey( $survey_admincode )

deletes all users registered for a given survey by its survey_admincode. is
used for deleting complete surveys.

=cut

sub delete_all_of_survey {
    my ( $self, $survey_admincode ) = @_;
}

=head2 list_options( $survey_usercode, $name )

returns a list of all options by position of a survey by the given 
survey_usercode for the voter identified by its name. in the list, 0
means, the user did decline the option. 1 means, the user accepted
the option. undef means, the user has not yet reviewed the option.

=cut

sub list_options {
    my ( $self, $survey_usercode, $name ) = @_;
    my $option;
    return $options;
}

1;

