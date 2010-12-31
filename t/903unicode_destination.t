use strict;
use Test::More tests => 60;
use RTF::Tokenizer;

my $DEBUG = 0; 
my @tokens = (
['group', '1', ''],
['control', 'upr', ''],
['group', '1', ''],
['control', '*', ''],
['control', 'bkmkstart', ''],
['text', 'LabGValue', ''],
['group', '0', ''],
['group', '1', ''],
['control', '*', ''],
['control', 'ud', ''],
['group', '1', ''],
['control', '*', ''],
['control', 'bkmkstart', ''],
['text', 'Lab', ''],
['control', 'u', '915'],
['text', 'Value', ''],
['group', '0', ''],
['group', '0', ''],
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
{\upr{\*\bkmkstart LabGValue}{\*\ud{\*\bkmkstart Lab\u915Value}}}