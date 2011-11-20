package Didledadldu::Manage::Survey;
use Mojo::Base 'Mojolicious::Controller';

=head1 Controller Didledadldu::Manage::Survey

controller for management of survey vide informations. options are seperate

=head1 METHODS

=head2 create_form

create an empty form for a new survey.

=cut

sub create_form {
    my $c = shift;
}

=head2 create

create a new survey and redirect to the survey view.

=cut

sub create {
    my $c = shift;
}

=head2 modify_form

show the modification form for an existing survey.

=cut

sub modify_form {
    my $c = shift;
}

=head2 modify

modify an existing survey.

=cut

sub modify {
    my $c = shift;
}

=head2 deactivate

unset the activation flag for the survey so that no one can participate.

=cut

sub deactivate {
    my $c = shift;
}

=head2 reactivate

set the activation flag for the survey so that user can participate

=cut

sub reactivate {
    my $c = shift;
}

=head2 delete

delete a given survey and delete all votes, options and voters for that (done in data model).

=cut

sub delete {
    my $c = shift;
}

1;

