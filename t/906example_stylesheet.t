use strict;
use Test::More tests => 330;
use RTF::Tokenizer;

my $DEBUG  = 0;
my @tokens = (
    [ 'group',   '1',                       '' ],
    [ 'control', 'stylesheet',              '' ],
    [ 'group',   '1',                       '' ],
    [ 'control', 'ql',                      '' ],
    [ 'control', 'li',                      '0' ],
    [ 'control', 'ri',                      '0' ],
    [ 'control', 'widctlpar',               '' ],
    [ 'control', 'aspalpha',                '' ],
    [ 'control', 'aspnum',                  '' ],
    [ 'control', 'faauto',                  '' ],
    [ 'control', 'adjustright',             '' ],
    [ 'control', 'rin',                     '0' ],
    [ 'control', 'lin',                     '0' ],
    [ 'control', 'itap',                    '0' ],
    [ 'control', 'fs',                      '24' ],
    [ 'control', 'lang',                    '1033' ],
    [ 'control', 'langfe',                  '1033' ],
    [ 'control', 'cgrid',                   '' ],
    [ 'control', 'langnp',                  '1033' ],
    [ 'control', 'langfenp',                '1033' ],
    [ 'control', 'snext',                   '0' ],
    [ 'text',    'Normal;',                 '' ],
    [ 'group',   '0',                       '' ],
    [ 'group',   '1',                       '' ],
    [ 'control', '*',                       '' ],
    [ 'control', 'cs',                      '10' ],
    [ 'control', 'additive',                '' ],
    [ 'text',    'Default Paragraph Font;', '' ],
    [ 'group',   '0',                       '' ],
    [ 'group',   '1',                       '' ],
    [ 'control', '*',                       '' ],
    [ 'control', 'cs',                      '15' ],
    [ 'control', 'additive',                '' ],
    [ 'control', 'b',                       '' ],
    [ 'control', 'ul',                      '' ],
    [ 'control', 'cf',                      '6' ],
    [ 'control', 'sbasedon',                '10' ],
    [ 'text',    'UNDERLINE;',              '' ],
    [ 'group',   '0',                       '' ],
    [ 'text',    ' ',                       '' ],
    [ 'group',   '1',                       '' ],
    [ 'control', '*',                       '' ],
    [ 'control', 'ts',                      '11' ],
    [ 'control', 'tsrowd',                  '' ],
    [ 'control', 'trftsWidthB',             '3' ],
    [ 'control', 'trpaddl',                 '108' ],
    [ 'control', 'trpaddr',                 '108' ],
    [ 'control', 'trpaddfl',                '3' ],
    [ 'control', 'trpaddft',                '3' ],
    [ 'control', 'trpaddfb',                '3' ],
    [ 'control', 'trpaddfr',                '3' ],
    [ 'control', 'tscellwidthfts',          '0' ],
    [ 'control', 'tsvertalt',               '' ],
    [ 'control', 'tsbrdrt',                 '' ],
    [ 'control', 'tsbrdrl',                 '' ],
    [ 'control', 'tsbrdrb',                 '' ],
    [ 'control', 'tsbrdrr',                 '' ],
    [ 'control', 'tsbrdrdgl',               '' ],
    [ 'control', 'tsbrdrdgr',               '' ],
    [ 'control', 'tsbrdrh',                 '' ],
    [ 'control', 'tsbrdrv',                 '' ],
    [ 'control', 'ql',                      '' ],
    [ 'control', 'li',                      '0' ],
    [ 'control', 'ri',                      '0' ],
    [ 'control', 'widctlpar',               '' ],
    [ 'control', 'aspalpha',                '' ],
    [ 'control', 'aspnum',                  '' ],
    [ 'control', 'faauto',                  '' ],
    [ 'control', 'adjustright',             '' ],
    [ 'control', 'rin',                     '0' ],
    [ 'control', 'lin',                     '0' ],
    [ 'control', 'itap',                    '0' ],
    [ 'control', 'fs',                      '20' ],
    [ 'control', 'lang',                    '1024' ],
    [ 'control', 'langfe',                  '1024' ],
    [ 'control', 'cgrid',                   '' ],
    [ 'control', 'langnp',                  '1024' ],
    [ 'control', 'langfenp',                '1024' ],
    [ 'control', 'snext',                   '11' ],
    [ 'control', 'ssemihidden',             '' ],
    [ 'text',    'Normal Table;  ',         '' ],
    [ 'group',   '0',                       '' ],
    [ 'group',   '1',                       '' ],
    [ 'control', 's',                       '16' ],
    [ 'control', 'qc',                      '' ],
    [ 'control', 'li',                      '0' ],
    [ 'control', 'ri',                      '0' ],
    [ 'control', 'widctlpar',               '' ],
    [ 'control', 'aspalpha',                '' ],
    [ 'control', 'aspnum',                  '' ],
    [ 'control', 'faauto',                  '' ],
    [ 'control', 'adjustright',             '' ],
    [ 'control', 'rin',                     '0' ],
    [ 'control', 'lin',                     '0' ],
    [ 'control', 'itap',                    '0' ],
    [ 'control', 'b',                       '' ],
    [ 'control', 'fs',                      '24' ],
    [ 'control', 'cf',                      '2' ],
    [ 'control', 'lang',                    '1033' ],
    [ 'control', 'langfe',                  '1033' ],
    [ 'control', 'cgrid',                   '' ],
    [ 'control', 'langnp',                  '1033' ],
    [ 'control', 'langfenp',                '1033' ],
    [ 'control', 'sbasedon',                '0' ],
    [ 'control', 'snext',                   '16' ],
    [ 'control', 'sautoupd',                '' ],
    [ 'text',    'CENTER;',                 '' ],
    [ 'group',   '0',                       '' ],
    [ 'group',   '0',                       '' ],
    [ 'eof',     '1',                       '0' ], );

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
{\stylesheet{\ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 \fs24\lang1033\langfe1033\cgrid\langnp1033\langfenp1033 \snext0 Normal;}{\*\cs10 \additive Default Paragraph Font;}{\*\cs15 \additive \b\ul\cf6 \sbasedon10 UNDERLINE;} {\*\ts11\tsrowd\trftsWidthB3\trpaddl108\trpaddr108\trpaddfl3 \trpaddft3\trpaddfb3\trpaddfr3\tscellwidthfts0\tsvertalt\tsbrdrt\tsbrdrl\tsbrdrb\tsbrdrr\tsbrdrdgl\tsbrdrdgr\tsbrdrh\tsbrdrv \ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0 \lin0\itap0 \fs20\lang1024\langfe1024\cgrid\langnp1024 \langfenp1024 \snext11 \ssemihidden Normal Table;  }{\s16\qc \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 \b\fs24\cf2\lang1033\langfe1033\cgrid\langnp1033\langfenp1033 \sbasedon0 \snext16 \sautoupd CENTER;}}
