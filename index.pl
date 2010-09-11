#!/usr/bin/perl 

use strict;
use warnings;

use lib './lib';
#use Data::Schema;
use Mojolicious::Lite;

get '/' => sub { shift->render(text => 'Hello World!') };
get '/:qid' => [ qid => qr/\w+/ ] => sub {
    my $self = shift;
    my $qid = $self->param('qid');
    $self->stash( title  => 'Testumfrage' );
    $self->stash( header => [qw(test 123 wow)]);
    $self->stash( rows   => [
            [qw(harry   1 0 1)],
            [qw(paul    0 0 1)],
            [qw(karsten 1 1 0)],
        ]);
} => 'qform';

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

@@ qform.html.ep
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
                <th><%= shift @$row %></th>
<% for my $entry ( @$row ) { %>
                <td><input type="checkbox"<%= $entry ? ' checked="checked"' : '' %> disabled="disabled" /></td>
<% } %>
            </tr>
<% } %>
        </table>

