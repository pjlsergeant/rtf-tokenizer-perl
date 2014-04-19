use strict;
use Test::More tests => 45;
use RTF::Tokenizer;

my $DEBUG  = 0;
my @tokens = (
    [ 'control', 'dfrstart', '0' ],
    [ 'control', 'dfrxst',   '0' ],
    [ 'control', 'dfrxst',   '5' ],
    [ 'control', 'dfrxst',   '0' ],
    [ 'control', 'dfrxst',   '51' ],
    [ 'control', 'dfrxst',   '0' ],
    [ 'control', 'dfrxst',   '45' ],
    [ 'control', 'dfrxst',   '0' ],
    [ 'control', 'dfrxst',   '52' ],
    [ 'control', 'dfrxst',   '0' ],
    [ 'control', 'dfrxst',   '66' ],
    [ 'control', 'dfrxst',   '0' ],
    [ 'control', 'dfrxst',   '46' ],
    [ 'control', 'dfrstop',  '10' ],
    [ 'eof',     '1',        '0' ], );

my $tokenizer = RTF::Tokenizer->new();

# Reading from DATA with read_file() causes all kinds of oddness
$tokenizer->read_string( join '', <DATA> );

if ($DEBUG) {
    while (1) {
        my ( $type, $argument, $param ) = $tokenizer->get_token();
        print "['$type', '$argument', '$param'],\n";
        exit if $type eq 'eof';
    }
} else {

    for (@tokens) {

        my ( $ret_type, $ret_argument, $ret_parameter ) = @{$_};
        my ( $type, $argument, $param ) = $tokenizer->get_token();

        is( $type,     $ret_type,      "Correctly found '$type'" );
        is( $argument, $ret_argument,  "Correctly found '$argument'" );
        is( $param,    $ret_parameter, "Correctly found '$param'" );

    }

}

__DATA__
\dfrstart0\dfrxst0\dfrxst5\dfrxst0\dfrxst51\dfrxst0\dfrxst45\dfrxst0\dfrxst52
\dfrxst0\dfrxst66\dfrxst0\dfrxst46\dfrstop10
