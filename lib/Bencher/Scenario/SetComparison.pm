package Bencher::Scenario::SetComparison;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark set comparison',
    participants => [
        {
            module => 'Test::Deep', # Test::Deep::NoTest is useless without importing
            code_template=>'state $set = Test::Deep::set(@{<set>}); Test::Deep::eq_deeply(<array>, $set)',
        },
        {
            module => 'Set::Tiny',
            code_template=>'state $set1 = Set::Tiny->new(@{<array>}); state $set2 = Set::Tiny->new(@{<set>}); $set1->symmetric_difference($set2)->size == 0 ? 1:0',
            tags => ['simple-elements'], # Set::Tiny stringifies arguments
        },
    ],
    datasets => [
        {name=>'elems=10num' , args=>{array=>[1..10] , set=>[reverse 1..10, 1] }},
        {name=>'elems=100num', args=>{array=>[1..100], set=>[reverse 1..100, 1]}},
        {name=>'elems=200num', args=>{array=>[1..200], set=>[reverse 1..200, 1]}},
    ],
};

1;
# ABSTRACT:

=head1 DESCRIPTION

TODO: include more set modules.

TODO: compare complex elements.


=head1 BENCHMARK NOTES

Test::Deep is slow :)


=head1 SEE ALSO

L<Bencher::Scenario::BagComparison>

L<Bencher::Scenario::SetOperationModules>
