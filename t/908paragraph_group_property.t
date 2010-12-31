use strict;
use Test::More tests => 69;
use RTF::Tokenizer;

my $DEBUG = 0; 
my @tokens = (
['group', '1', ''],
['control', '*', ''],
['control', 'pgptbl', ''],
['group', '1', ''],
['control', 'pgp', ''],
['control', 'ipgp', '13'],
['control', 'itap', '0'],
['control', 'li', '0'],
['control', 'ri', '0'],
['control', 'sb', '0'],
['control', 'sa', '0'],
['group', '0', ''],
['group', '1', ''],
['control', 'pgp', ''],
['control', 'ipgp', '80'],
['control', 'itap', '0'],
['control', 'li', '720'],
['control', 'ri', '0'],
['control', 'sb', '100'],
['control', 'sa', '100'],
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
{\*\pgptbl {\pgp\ipgp13\itap0\li0\ri0\sb0\sa0}{\pgp\ipgp80\itap0\li720\ri0\sb100\sa100}}