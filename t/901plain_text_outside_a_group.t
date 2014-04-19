use strict;
use Test::More tests => 333;
use RTF::Tokenizer;

my $DEBUG  = 0;
my @tokens = (
    [ 'group',   '1',                   '' ],
    [ 'control', 'rtf',                 '' ],
    [ 'control', 'ansi',                '' ],
    [ 'control', 'deff',                '0' ],
    [ 'group',   '1',                   '' ],
    [ 'control', 'fonttbl',             '' ],
    [ 'group',   '1',                   '' ],
    [ 'control', 'f',                   '0' ],
    [ 'control', 'froman',              '' ],
    [ 'text',    'Tms Rmn;',            '' ],
    [ 'group',   '0',                   '' ],
    [ 'group',   '1',                   '' ],
    [ 'control', 'f',                   '1' ],
    [ 'control', 'fdecor',              '' ],
    [ 'text',    'Symbol;',             '' ],
    [ 'group',   '0',                   '' ],
    [ 'group',   '1',                   '' ],
    [ 'control', 'f',                   '2' ],
    [ 'control', 'fswiss',              '' ],
    [ 'text',    'Helv;',               '' ],
    [ 'group',   '0',                   '' ],
    [ 'group',   '0',                   '' ],
    [ 'group',   '1',                   '' ],
    [ 'control', 'colortbl',            '' ],
    [ 'text',    ';',                   '' ],
    [ 'control', 'red',                 '0' ],
    [ 'control', 'green',               '0' ],
    [ 'control', 'blue',                '0' ],
    [ 'text',    ';',                   '' ],
    [ 'control', 'red',                 '0' ],
    [ 'control', 'green',               '0' ],
    [ 'control', 'blue',                '255' ],
    [ 'text',    ';',                   '' ],
    [ 'control', 'red',                 '0' ],
    [ 'control', 'green',               '255' ],
    [ 'control', 'blue',                '255' ],
    [ 'text',    ';',                   '' ],
    [ 'control', 'red',                 '0' ],
    [ 'control', 'green',               '255' ],
    [ 'control', 'blue',                '0' ],
    [ 'text',    ';',                   '' ],
    [ 'control', 'red',                 '255' ],
    [ 'control', 'green',               '0' ],
    [ 'control', 'blue',                '255' ],
    [ 'text',    ';',                   '' ],
    [ 'control', 'red',                 '255' ],
    [ 'control', 'green',               '0' ],
    [ 'control', 'blue',                '0' ],
    [ 'text',    ';',                   '' ],
    [ 'control', 'red',                 '255' ],
    [ 'control', 'green',               '255' ],
    [ 'control', 'blue',                '0' ],
    [ 'text',    ';',                   '' ],
    [ 'control', 'red',                 '255' ],
    [ 'control', 'green',               '255' ],
    [ 'control', 'blue',                '255' ],
    [ 'text',    ';',                   '' ],
    [ 'group',   '0',                   '' ],
    [ 'group',   '1',                   '' ],
    [ 'control', 'stylesheet',          '' ],
    [ 'group',   '1',                   '' ],
    [ 'control', 'fs',                  '20' ],
    [ 'control', 'snext',               '0' ],
    [ 'text',    'Normal;',             '' ],
    [ 'group',   '0',                   '' ],
    [ 'group',   '0',                   '' ],
    [ 'group',   '1',                   '' ],
    [ 'control', 'info',                '' ],
    [ 'group',   '1',                   '' ],
    [ 'control', 'author',              '' ],
    [ 'text',    'John Doe',            '' ],
    [ 'group',   '0',                   '' ],
    [ 'group',   '1',                   '' ],
    [ 'control', 'creatim',             '' ],
    [ 'control', 'yr',                  '1990' ],
    [ 'control', 'mo',                  '7' ],
    [ 'control', 'dy',                  '30' ],
    [ 'control', 'hr',                  '10' ],
    [ 'control', 'min',                 '48' ],
    [ 'group',   '0',                   '' ],
    [ 'group',   '1',                   '' ],
    [ 'control', 'version',             '1' ],
    [ 'group',   '0',                   '' ],
    [ 'group',   '1',                   '' ],
    [ 'control', 'edmins',              '0' ],
    [ 'group',   '0',                   '' ],
    [ 'group',   '1',                   '' ],
    [ 'control', 'nofpages',            '1' ],
    [ 'group',   '0',                   '' ],
    [ 'group',   '1',                   '' ],
    [ 'control', 'nofwords',            '0' ],
    [ 'group',   '0',                   '' ],
    [ 'group',   '1',                   '' ],
    [ 'control', 'nofchars',            '0' ],
    [ 'group',   '0',                   '' ],
    [ 'group',   '1',                   '' ],
    [ 'control', 'vern',                '8351' ],
    [ 'group',   '0',                   '' ],
    [ 'group',   '0',                   '' ],
    [ 'control', 'widoctrl',            '' ],
    [ 'control', 'ftnbj',               '' ],
    [ 'control', 'sectd',               '' ],
    [ 'control', 'linex',               '0' ],
    [ 'control', 'endnhere',            '' ],
    [ 'control', 'pard',                '' ],
    [ 'control', 'plain',               '' ],
    [ 'control', 'fs',                  '20' ],
    [ 'text',    'This is plain text.', '' ],
    [ 'control', 'par',                 '' ],
    [ 'group',   '0',                   '' ],
    [ 'eof',     '1',                   '0' ] );

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

# The original RTF is the first section below. It's illegal in two ways. Firstly,
# the sequence \snext0Normal; is illegal, as control-word terminators are not allowed
# to be letters or numbers. Secondly, there are newline characters between the \'s and
# blue and green. Bad Microsoft.

#{\rtf\ansi\deff0{\fonttbl{\f0\froman Tms Rmn;}{\f1\fdecor
#Symbol;}{\f2\fswiss Helv;}}{\colortbl;\red0\green0\blue0;
#\red0\green0\blue255;\red0\green255\blue255;\red0\green255\
#blue0;\red255\green0\blue255;\red255\green0\blue0;\red255\
#green255\blue0;\red255\green255\blue255;}{\stylesheet{\fs20 \snext0Normal;}}{\info{\author John Doe}
#{\creatim\yr1990\mo7\dy30\hr10\min48}{\version1}{\edmins0}
#{\nofpages1}{\nofwords0}{\nofchars0}{\vern8351}}\widoctrl\ftnbj \sectd\linex0\endnhere \pard\plain \fs20 This is plain text.\par}

__DATA__
{\rtf\ansi\deff0{\fonttbl{\f0\froman Tms Rmn;}{\f1\fdecor 
Symbol;}{\f2\fswiss Helv;}}{\colortbl;\red0\green0\blue0;
\red0\green0\blue255;\red0\green255\blue255;\red0\green255\blue0;\red255\green0\blue255;\red255\green0\blue0;\red255\green255\blue0;\red255\green255\blue255;}{\stylesheet{\fs20 \snext0 Normal;}}{\info{\author John Doe}
{\creatim\yr1990\mo7\dy30\hr10\min48}{\version1}{\edmins0}
{\nofpages1}{\nofwords0}{\nofchars0}{\vern8351}}\widoctrl\ftnbj \sectd\linex0\endnhere \pard\plain \fs20 This is plain text.\par}
