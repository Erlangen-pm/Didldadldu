#!/usr/bin/perl 

use strict;
use warnings;

use lib './lib';
use Data::Schema;
use Mojolicious::Lite;

sub get_schema { Data::Schema->connect('dbi:SQLite:data.sqlite') }

get '/' => sub { shift->render(text => 'Hello World!') };
get '/:code' => [ code => qr/\w+/ ] => sub {
    my $self   = shift;
    my $code   = $self->param('code');
    my $schema = get_schema();
    my $poll   = $schema->resultset('Polls')->search( { code => $code } )->next;
    return unless $poll;
    my $options =
      $schema->resultset('Options')
      ->search( { pollid => $poll->id }, { join => ['users'] } );
    return unless $options;
    $self->stash( title => $poll->text );
    my ( $rows, $header, $user ) = ( [], [], [] );

    while ( my $option = $options->next ) {

    }
    $self->stash( header => $header );
    $self->stash( rows   => $rows );
    $self->stash( user   => $user );
} => 'pollform';

app->start;

__DATA__

@@ not_found.html.ep
<html><head><title>404</title></head><body>:-(</body></html>

@@ layouts/default.html.ep
<html>
    <head>
        <title>Umfrage <%= $title %></title>
    </head>
    <body>
<%= content %>
    </body>
</html>

@@ pollform.html.ep
% layout 'default';
        <table>
            <tr>
                <th>&nbsp;</th>
<% for my $head ( @$header ) { %>
                <th><%= $head %></th>
<% } %>
            </tr>

<% for my $row ( @$rows ) { %>
            <tr>
                <th><%= shift @$rows %></th>
<% for my $entry ( @$rows ) { %>
                <td><input type="checkbox"<%= $entry ? ' checked="checked"' : '' %> disabled="disabled" /></td>
<% } %>
            </tr>
<% } %>
<% if ( defined $user ) { %>
            <tr>
                <th class="uservote"><%= shift @$user %></th>
<% for my $entry ( @$user ) { %>
                <td><input type="checkbox"<%= $entry ? ' checked="checked"' : '' %> /></td>
<% } %>
            </tr>
<% } %>
        </table>

