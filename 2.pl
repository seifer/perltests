#!/usr/bin/perl

use strict;
use warnings;

# External modules
use Benchmark;

Benchmark::cmpthese(10000000, {
    ';' => sub {
        my $x = 1; my $y = 2;
    },
    ',' => sub {
        my $x = 1, my $y = 2;
    },
});
