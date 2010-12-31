use strict;
use Test::More tests => 309;
use RTF::Tokenizer;

my $DEBUG = 0; 
my @tokens = (
['control', 'pard', ''],
['control', 'plain', ''],
['control', 'ql', ''],
['control', 'li', '0'],
['control', 'ri', '0'],
['control', 'widctlpar', ''],
['control', 'aspalpha', ''],
['control', 'aspnum', ''],
['control', 'faauto', ''],
['control', 'outlinelevel', '0'],
['control', 'adjustright', ''],
['control', 'rin', '0'],
['control', 'lin', '0'],
['control', 'itap', '0'],
['control', 'fs', '24'],
['control', 'lang', '1033'],
['control', 'langfe', '1033'],
['control', 'cgrid', ''],
['control', 'langnp', '1033'],
['control', 'langfenp', '1033'],
['group', '1', ''],
['text', 'This is the Normal Style', ''],
['control', 'par', ''],
['group', '0', ''],
['control', 'pard', ''],
['control', 'ql', ''],
['control', 'li', '0'],
['control', 'ri', '0'],
['control', 'widctlpar', ''],
['control', 'aspalpha', ''],
['control', 'aspnum', ''],
['control', 'faauto', ''],
['control', 'adjustright', ''],
['control', 'rin', '0'],
['control', 'lin', '0'],
['control', 'itap', '0'],
['group', '1', ''],
['control', 'par', ''],
['group', '0', ''],
['control', 'pard', ''],
['control', 'plain', ''],
['control', 's', '16'],
['control', 'qc', ''],
['control', 'li', '0'],
['control', 'ri', '0'],
['control', 'widctlpar', ''],
['control', 'aspalpha', ''],
['control', 'aspnum', ''],
['control', 'faauto', ''],
['control', 'outlinelevel', '0'],
['control', 'adjustright', ''],
['control', 'rin', '0'],
['control', 'lin', '0'],
['control', 'itap', '0'],
['control', 'b', ''],
['control', 'fs', '24'],
['control', 'cf', '2'],
['control', 'lang', '1033'],
['control', 'langfe', '1033'],
['control', 'cgrid', ''],
['control', 'langnp', '1033'],
['control', 'langfenp', '1033'],
['group', '1', ''],
['text', 'This is a centered paragraph with blue, bold font. I call the style CENTER.', ''],
['control', 'par', ''],
['group', '0', ''],
['control', 'pard', ''],
['control', 'plain', ''],
['control', 'ql', ''],
['control', 'li', '0'],
['control', 'ri', '0'],
['control', 'widctlpar', ''],
['control', 'aspalpha', ''],
['control', 'aspnum', ''],
['control', 'faauto', ''],
['control', 'adjustright', ''],
['control', 'rin', '0'],
['control', 'lin', '0'],
['control', 'itap', '0'],
['control', 'fs', '24'],
['control', 'lang', '1033'],
['control', 'langfe', '1033'],
['control', 'cgrid', ''],
['control', 'langnp', '1033'],
['control', 'langfenp', '1033'],
['group', '1', ''],
['control', 'par', ''],
['text', 'The word ', ''],
['control', "'", '93'],
['group', '0', ''],
['group', '1', ''],
['control', 'cs', '15'],
['control', 'b', ''],
['control', 'ul', ''],
['control', 'cf', '6'],
['text', 'style', ''],
['group', '0', ''],
['group', '1', ''],
['control', "'", '94'],
['text', ' is red and underlined. I used a style I called UNDERLINE.', ''],
['control', 'par', ''],
['group', '0', ''],
['eof', '1', '0'],
);

my $tokenizer = RTF::Tokenizer->new();

# Reading from DATA with read_file() causes all kinds of oddness
$tokenizer->read_string( join '', <DATA> );

if ($DEBUG) {
	while (1) {
		my ($type, $argument, $param) = $tokenizer->get_token();
		print "['$type', '$argument', '$param'],\n";	
		exit if $type eq 'eof';
	}
} else {

	for (@tokens) {
	
		my ($ret_type, $ret_argument, $ret_parameter) = @{ $_ };
		my ($type, $argument, $param) = $tokenizer->get_token();
	
		is( $type, $ret_type, "Correctly found '$type'");
		is( $argument, $ret_argument, "Correctly found '$argument'");
		is( $param, $ret_parameter, "Correctly found '$param'");
	
	}

}

__DATA__
\pard\plain \ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\outlinelevel0\adjustright\rin0\lin0\itap0 \fs24\lang1033\langfe1033\cgrid\langnp1033\langfenp1033 {This is the Normal Style
\par }\pard \ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 {\par }\pard\plain \s16\qc \li0\ri0\widctlpar\aspalpha\aspnum\faauto\outlinelevel0\adjustright
\rin0\lin0\itap0 \b\fs24\cf2\lang1033\langfe1033\cgrid\langnp1033\langfenp1033 
{This is a centered paragraph with blue, bold font. I call the style CENTER.\par }
\pard\plain \ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 \fs24\lang1033\langfe1033\cgrid\langnp1033\langfenp1033 
{\par The word \'93}{\cs15\b\ul\cf6 style}{\'94 is red and underlined. I used a style I called UNDERLINE.\par }
