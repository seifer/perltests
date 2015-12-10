#!/usr/bin/perl

use strict;
use warnings;

use Bencher;

my $str = 'favasdvoinasdf';

test re => sub {
    $str =~ /^(yes|no)$/i ? 1 : 0;
};

test if => sub {
    $str eq 'yes' || $str eq 'no' ? 1 : 0;
};

=result
              if         27373352 ops/s (3.23)
              re          8469267 ops/s (1.00)
=cut
