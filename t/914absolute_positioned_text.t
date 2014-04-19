use strict;
use Test::More tests => 51;
use RTF::Tokenizer;

my $DEBUG  = 0;
my @tokens = (
    [ 'control', 'par',             '' ],
    [ 'control', 'pard',            '' ],
    [ 'control', 'pvpg',            '' ],
    [ 'control', 'phpg',            '' ],
    [ 'control', 'posxc',           '' ],
    [ 'control', 'posyt',           '' ],
    [ 'control', 'absw',            '5040' ],
    [ 'control', 'dxfrtest',        '173' ],
    [ 'text',    'First APO para',  '' ],
    [ 'control', 'par',             '' ],
    [ 'control', 'pard',            '' ],
    [ 'control', 'phmrg',           '' ],
    [ 'control', 'posxo',           '' ],
    [ 'control', 'posyc',           '' ],
    [ 'control', 'dxfrtext',        '1152' ],
    [ 'text',    'Second APO para', '' ],
    [ 'eof',     '1',               '0' ], );

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
\par \pard \pvpg\phpg\posxc\posyt\absw5040\dxfrtest173 First APO para
\par \pard \phmrg\posxo\posyc\dxfrtext1152 Second APO para
