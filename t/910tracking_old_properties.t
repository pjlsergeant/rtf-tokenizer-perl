use strict;
use Test::More tests => 207;
use RTF::Tokenizer;

my $DEBUG = 0; 
my @tokens = (
['group', '1', ''],
['control', 'rtlch', ''],
['control', 'fcs', '1'],
['control', 'af', '0'],
['control', 'ltrch', ''],
['control', 'fcs', '0'],
['control', 'insrsid', '2778197'],
['control', 'hich', ''],
['control', 'af', '0'],
['control', 'dbch', ''],
['control', 'af', '13'],
['control', 'loch', ''],
['control', 'f', '0'],
['text', 'This ', ''],
['group', '0', ''],
['group', '1', ''],
['control', 'rtlch', ''],
['control', 'fcs', '1'],
['control', 'ab', ''],
['control', 'af', '0'],
['control', 'ltrch', ''],
['control', 'fcs', '0'],
['control', 'b', ''],
['control', 'i', ''],
['control', 'crauth', '1'],
['control', 'crdate', '1717000906'],
['control', 'insrsid', '2778197'],
['control', 'charrsid', '2778197'],
['group', '1', ''],
['control', '*', ''],
['control', 'oldcprops', ''],
['control', 'b', '0'],
['control', 'i', '0'],
['control', 'crauth', '1'],
['control', 'crdate', '1717000906'],
['control', 'insrsid', '2778197'],
['control', 'charrsid', '2778197'],
['group', '0', ''],
['control', 'hich', ''],
['control', 'af', '0'],
['control', 'dbch', ''],
['control', 'af', '13'],
['control', 'loch', ''],
['control', 'f', '0'],
['text', 'is a', ''],
['group', '0', ''],
['group', '1', ''],
['control', 'rtlch', ''],
['control', 'fcs', '1'],
['control', 'af', '0'],
['control', 'ltrch', ''],
['control', 'fcs', '0'],
['control', 'insrsid', '2778197'],
['control', 'hich', ''],
['control', 'af', '0'],
['control', 'dbch', ''],
['control', 'af', '13'],
['control', 'loch', ''],
['control', 'f', '0'],
['text', ' test.', ''],
['group', '0', ''],
['group', '1', ''],
['control', 'rtlch', ''],
['control', 'fcs', '1'],
['control', 'af', '0'],
['control', 'ltrch', ''],
['control', 'fcs', '0'],
['control', 'insrsid', '15803535'],
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

# Original RTF was illegal, using Õ where ' was appropriate:
# {\insrsid8282541 This is text.} {\insrsid8282541 Item  in List  \par{\listtext\pard\plain\f3\insrsid8282541 \loch\af3\dbch\af0 \hich\f3 \Õb7\tab}

__DATA__
{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2778197 \hich\af0\dbch\af13\loch\f0 This }{\rtlch\fcs1 \ab\af0 \ltrch\fcs0 \b\i\crauth1\crdate1717000906\insrsid2778197\charrsid2778197 {\*\oldcprops \b0\i0\crauth1\crdate1717000906\insrsid2778197\charrsid2778197 }\hich\af0\dbch\af13\loch\f0 is a}{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2778197 \hich\af0\dbch\af13\loch\f0  test.}{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid15803535
