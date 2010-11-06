#!/usr/bin/perl 

use strict;
use warnings;

use DBI;
use Mojolicious::Lite;

sub get_dbh {
    DBI->connect( 'dbi:SQLite:data.sqlite', '', '', { RaiseError => 1 } );
}

get '/' => sub { shift->render( text => 'Hello World!' ) };
get '/:code' => [ code => qr/\w+/ ] => sub {
    my $self = shift;
    my $code = $self->param('code');
    my $dbh  = get_dbh();
    return unless $poll;
    my $header = [ map { $_->[0] } @{ $dbh->fetchall_arrayref( << 'EOSQL' ) } ];
SELECT o.text
FROM options o 
    INNER JOIN polls p ON o.pollid=p.id 
WHERE p.code=?
ORDER BY o.id
EOSQL
    return unless $header;
    $self->stash( title => $poll->text );
    my ( $rows, $user ) = ( [], [] );

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

