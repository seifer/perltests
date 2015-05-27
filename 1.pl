#!/usr/bin/perl

use strict;
use warnings;

# External modules
use Benchmark;

Benchmark::cmpthese(100000000, {
    do => sub {
        do { ; }
    },
    block => sub {
        { ; }
    },
});
