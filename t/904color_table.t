use strict;
use Test::More tests => 207;
use RTF::Tokenizer;

my $DEBUG = 0; 
my @tokens = (
['group', '1', ''],
['control', 'colortbl', ''],
['text', ';', ''],
['control', 'red', '0'],
['control', 'green', '0'],
['control', 'blue', '0'],
['text', ';', ''],
['control', 'red', '0'],
['control', 'green', '0'],
['control', 'blue', '255'],
['text', ';', ''],
['control', 'red', '0'],
['control', 'green', '255'],
['control', 'blue', '255'],
['text', ';', ''],
['control', 'red', '0'],
['control', 'green', '255'],
['control', 'blue', '0'],
['text', ';', ''],
['control', 'red', '255'],
['control', 'green', '0'],
['control', 'blue', '255'],
['text', ';', ''],
['control', 'red', '255'],
['control', 'green', '0'],
['control', 'blue', '0'],
['text', ';', ''],
['control', 'red', '255'],
['control', 'green', '255'],
['control', 'blue', '0'],
['text', ';', ''],
['control', 'red', '255'],
['control', 'green', '255'],
['control', 'blue', '255'],
['text', ';', ''],
['control', 'red', '0'],
['control', 'green', '0'],
['control', 'blue', '128'],
['text', ';', ''],
['control', 'red', '0'],
['control', 'green', '128'],
['control', 'blue', '128'],
['text', ';', ''],
['control', 'red', '0'],
['control', 'green', '128'],
['control', 'blue', '0'],
['text', ';', ''],
['control', 'red', '128'],
['control', 'green', '0'],
['control', 'blue', '128'],
['text', ';', ''],
['control', 'red', '128'],
['control', 'green', '0'],
['control', 'blue', '0'],
['text', ';', ''],
['control', 'red', '128'],
['control', 'green', '128'],
['control', 'blue', '0'],
['text', ';', ''],
['control', 'red', '128'],
['control', 'green', '128'],
['control', 'blue', '128'],
['text', ';', ''],
['control', 'red', '192'],
['control', 'green', '192'],
['control', 'blue', '192'],
['text', ';', ''],
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
{\colortbl;\red0\green0\blue0;\red0\green0\blue255;\red0\green255\blue255;\red0\green255\blue0;\red255\green0\blue255;\red255\green0\blue0;\red255\green255\blue0;\red255\green255\blue255;\red0\green0\blue128;\red0\green128\blue128;\red0\green128\blue0;\red128\green0\blue128;\red128\green0\blue0;\red128\green128\blue0;\red128\green128\blue128;\red192\green192\blue192;}