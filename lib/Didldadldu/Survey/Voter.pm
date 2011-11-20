package Didldadldu::Survey::Voter;
use Mojo::Base 'Mojolicious::Controller';

=head1 Didldadldu::Survey::Voter

displays voter information and stuff

=head1 METHODS

=head2 view

show informations for a single voter.

=cut

sub view {
    my $c = shift;
}

=head2 register

register as a voter.

=cut

sub register {
    my $c = shift;
}

=head2 modify

modify information about a voter.

=cut

sub modify {
    my $c = shift;
}

=head2 delete

delete a voter and its corresponding votes (done via data schema).

=cut

sub delete {
    my $c = shift;
}

1;

