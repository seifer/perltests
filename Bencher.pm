package Bencher;

use strict;
use warnings;

# External modules
use Benchmark;

my @tests;

sub import {
    my ($class) = @_;
    my $caller = caller;

    {
        no strict;
        *{"$caller\::test"} = \&test;
    }
}

sub test($$) {
    push @tests, [shift, Benchmark::countit(1, shift)];
}

END {
    @tests = sort {
        $b->[1]->iters <=> $a->[1]->iters
    } @tests;

    my $min;

    foreach my $t (@tests) {
        if (! defined $min || $t->[1]->iters < $min) {
            $min = $t->[1]->iters;
        }
    }

    my $fh; 

    open $fh, '<', $0;
    read $fh, my $buffer, -s $0;
    close $fh;

    my $output = '';

    foreach my $t (@tests) {
        $output .= sprintf "%16s %16d ops/s (%.2f)\n", $t->[0], $t->[1]->iters, $t->[1]->iters / $min;
    }

    if ($buffer =~ /=result/) {
        $buffer =~ s/=result.*=cut/=result\n$output=cut\n/s;
    } else {
        $buffer .= "\n";
        $buffer .= "=result\n";
        $buffer .= $output;
        $buffer .= "=cut\n";
    }

    open $fh, '>', $0;
    print $fh $buffer;
    close $fh;

    print $output;
}

1;
