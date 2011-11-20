package Didldadldu::Manage::Option;
use Mojo::Base 'Mojolicious::Controller';

=head1 Controller Manage_Option

manages options of the survey

=head1 METHODS

=head2 create_form

create an empty form for a new option.

=cut

sub create_form {
    my $c = shift;
}

=head2 create

create a new option and redirect to the survey admin interface.

=cut

sub create {
    my $c = shift;
}

=head2 modify_form

show the modification form for an existing option.

=cut

sub modify_form {
    my $c = shift;
}

=head2 modify

modify an existing option and redirect to the survey admin interface.

=cut

sub modify {
    my $c = shift;
}

=head2 move

move an existing option to a given new position and recalculate the other
options positions (done in the data model).

=cut

sub move {
    my $c = shift;
}

=head2 delete

delete a given option and delete all votes for that (done in data model).

=cut

sub delete {
    my $c = shift;
}

1;

