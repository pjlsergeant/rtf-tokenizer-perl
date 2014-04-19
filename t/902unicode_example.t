use strict;
use Test::More tests => 9;
use RTF::Tokenizer;

my $DEBUG  = 0;
my @tokens = (
    [ 'text',    'Lab',    '' ],
    [ 'control', 'u',      '915' ],
    [ 'text',    'GValue', '' ], );

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
Lab\u915GValue
