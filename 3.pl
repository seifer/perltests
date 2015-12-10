#!/usr/bin/perl

use strict;
use warnings;

use Bencher;
use List::MoreUtils;

my @arr = map int(rand(1000000)), (1..100);

test uniq => sub {
    List::MoreUtils::uniq(@arr);
};

test hash => sub {
    values %{{ map { $_ => $_ } @arr }};
};

=result
            uniq            61952 ops/s (2.02)
            hash            30720 ops/s (1.00)
=cut




