#!/usr/bin/perl

use strict;
use warnings;

use Bencher;

test ';' => sub {
    my $x = 1; my $y = 2;
};

test ',' => sub {
    my $x = 1, my $y = 2;
};

=result
               ;         12233386 ops/s (1.00)
               ,         12233386 ops/s (1.00)
=cut
