package Schema::Result::Survey;
use base 'DBIx::Class::Core';

=head1 Resultset Survey

represents the listed surveys

=cut

__PACKAGE__->table('survey');

=head1 ATTRIBUTES

=head2 id

primary key

=head2 usercode

unique 16 digit alphanumerical key for referencing the survey from the outside.

=head2 admincode

unique 32 digit alphanumerical key for referencing the survey from the outside
by the admin (aka initiator) of the survey.

=head2 text

something to read for the voters.

=head2 initiator

name string of the initiator of the survey. just for the record.

=head2 email

email adress of the initiator for mail notification about votes.

=head2 creation_date

date of when the survey was created.

=head2 modificationdate

date of when options changed for the survey (only modification of text of the 
option or deletion of options is tracked here).

=head2 active

flag whether the survey is active. voters can only vote for active surveys.

=cut

__PACKAGE__->add_columns(
    id => { data_type => 'bigint', is_nullable => 0, is_auto_increment => 1 },
    usercode  => { data_type => 'char',    size => 16,   is_nullable => 0 },
    admincode => { data_type => 'char',    size => 32,   is_nullable => 0 },
    text      => { data_type => 'varchar', size => 4096, is_nullable => 0 },
    initiator => { data_type => 'varchar', size => 255,  is_nullable => 0 },
    email     => { data_type => 'varchar', size => 512,  is_nullable => 1 },
    creationdate =>
      { data_type => 'datetime', is_nullable => 0, default_value => \'now()' },
    modificationdate =>
      { data_type => 'datetime', is_nullable => 0, default_value => \'now()' },
    active =>
      { data_type => 'smallint', is_nullable => 0, default_value => \'1' },
);

__PACKAGE__->set_primary_key('id');

=head1 CONSTRAINS

=head2 unique constraints

usercode and admincode each must be unique in the table because users and 
admins identify survey with these codes.

=cut

__PACKAGE__->add_unique_constraint( ['usercode'] );
__PACKAGE__->add_unique_constraint( ['admincode'] );

=head2 options

every survey consists of one or many options - otherwise it would be dull.

=cut

__PACKAGE__->has_many( options => 'Schema::Result::Option', 'survey_id' );

=head2 voters

for every survey there are many voters registered which could vote for options.

=cut

__PACKAGE__->has_many( voters => 'Schema::Result::Voter', 'survey_id' );

=head1 METHODS

=head2 create( $text, $initiator, $email )

creates a new survey with the given attributes. sets dates automatically.
active flag is also set automatically to true. survey codes will be generated
and information will be send via email to the surveys initiators email (given
via email-attribute).

=cut

sub create {
    my ( $self, $text, $initiator, $email ) = @_;
}

=head2 user_view( $usercode )

returns the informations of the survey referenced by a given usercode.

=cut

sub user_view {
    my ( $self, $usercode ) = @_;
    my $data;
    return $data;
}

=head2 admin_view( $admincode )

returns the informations of the survey referenced by a given admincode.

=cut

sub admin_view {
    my ( $self, $admincode ) = @_;
    my $data;
    return $data;
}

=head2 modify( $admincode, $new_text, $new_initiator, $new_email )

modify the attributes of survey referenced by its admincode. empty attributes
will not be altered.

=cut

sub modify {
    my ( $self, $admincode, $new_text, $new_initiator, $new_email ) = @_;
}

=head2 deactivate( $admincode )

sets the active attribute to false for the survey referenced by its admincode
in order to prohibit users from voting.

=cut

sub deactivate {
    my ( $self, $admincode ) = @_;
}

=head2 reactivate( $admincode )

sets the active attribute to true for the survey referenced by its admincode
in order to make the survey available for users in order to cast their votes.

=cut

sub reactivate {
    my ( $self, $admincode ) = @_;
}

=head2 delete( $admincode )

deletes a survey and all of its votes, voters and options referenced by its
admincode.

=cut

sub delete {
    my ( $self, $admincode ) = @_;
}

=head2 list_voters( $usercode )

lists all users that have allready registered for the survey by its given
usercode.

=cut

sub list_voters {
    my ( $self, $usercode ) = @_;
    my $voters;
    return $voters;
}

=head2 list_options( $usercode )

lists all options available for the survey referenced by its usercode.

=cut

sub list_options {
    my ( $self, $usercode ) = @_;
    my $options;
    return $options;
}

=head2 list_votes_matrix( $usercode )

returns a two dimensional array containing a list of voters in the first 
dimension and a list of corresponding options in the second dimension.
values can be 1, if the voter applied for the particular option or
0 otherwise. as a third option, the value can be undef, when the voter
has not cast a vote yet for the option.

=cut

sub list_votes_matrix {
    my ( $self, $usercode ) = @_;
    my $matrix;
    return $matrix;
}

1;

