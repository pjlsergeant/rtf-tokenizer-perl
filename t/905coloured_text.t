use strict;
use Test::More tests => 21;
use RTF::Tokenizer;

my $DEBUG  = 0;
my @tokens = (
    [ 'group',   '1',  '' ],
    [ 'control', 'f',  '1' ],
    [ 'control', 'cb', '1' ],
    [ 'control', 'cf', '2' ],
    [   'text',
        'This is colored text. The background is color 1 and the foreground is color 2.',
        ''
    ],
    [ 'group', '0', '' ],
    [ 'eof',   '1', '0' ], );

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
{\f1\cb1\cf2 This is colored text. The background is color
 1 and the foreground is color 2.}
