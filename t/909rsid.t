use strict;
use Test::More tests => 78;
use RTF::Tokenizer;

my $DEBUG  = 0;
my @tokens = (
    [ 'group',   '1',               '' ],
    [ 'control', 'insrsid',         '8282541' ],
    [ 'text',    'This is text.',   '' ],
    [ 'group',   '0',               '' ],
    [ 'text',    ' ',               '' ],
    [ 'group',   '1',               '' ],
    [ 'control', 'insrsid',         '8282541' ],
    [ 'text',    'Item  in List  ', '' ],
    [ 'control', 'par',             '' ],
    [ 'group',   '1',               '' ],
    [ 'control', 'listtext',        '' ],
    [ 'control', 'pard',            '' ],
    [ 'control', 'plain',           '' ],
    [ 'control', 'f',               '3' ],
    [ 'control', 'insrsid',         '8282541' ],
    [ 'control', 'loch',            '' ],
    [ 'control', 'af',              '3' ],
    [ 'control', 'dbch',            '' ],
    [ 'control', 'af',              '0' ],
    [ 'control', 'hich',            '' ],
    [ 'control', 'f',               '3' ],
    [ 'control', "'",               'b7' ],
    [ 'control', 'tab',             '' ],
    [ 'group',   '0',               '' ],
    [ 'group',   '0',               '' ],
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

# Original RTF was illegal, using Õ where ' was appropriate:
# {\insrsid8282541 This is text.} {\insrsid8282541 Item  in List  \par{\listtext\pard\plain\f3\insrsid8282541 \loch\af3\dbch\af0 \hich\f3 \Õb7\tab}

__DATA__
{\insrsid8282541 This is text.} {\insrsid8282541 Item  in List  \par{\listtext\pard\plain\f3\insrsid8282541 \loch\af3\dbch\af0 \hich\f3 \'b7\tab}}
