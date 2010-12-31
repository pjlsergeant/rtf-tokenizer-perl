use strict;
use Test::More tests => 252;
use RTF::Tokenizer;

my $DEBUG = 0; 
my @tokens = (
['control', 'pnrstart', '0'],
['control', 'pnrxst', '0'],
['control', 'pnrxst', '5'],
['control', 'pnrxst', '0'],
['control', 'pnrxst', '1'],
['control', 'pnrxst', '0'],
['control', 'pnrxst', '45'],
['control', 'pnrxst', '0'],
['control', 'pnrxst', '2'],
['control', 'pnrxst', '0'],
['control', 'pnrxst', '3'],
['control', 'pnrxst', '0'],
['control', 'pnrxst', '46'],
['control', 'pnrstop', '12'],
['control', 'pnrstart', '1'],
['control', 'pnrrgb', '1'],
['control', 'pnrrgb', '3'],
['control', 'pnrrgb', '4'],
['control', 'pnrrgb', '0'],
['control', 'pnrrgb', '0'],
['control', 'pnrrgb', '0'],
['control', 'pnrrgb', '0'],
['control', 'pnrrgb', '0'],
['control', 'pnrrgb', '0'],
['control', 'pnrstop', '9'],
['control', 'pnrstart', '2'],
['control', 'pnrnfc', '0'],
['control', 'pnrnfc', '0'],
['control', 'pnrnfc', '0'],
['control', 'pnrnfc', '0'],
['control', 'pnrnfc', '0'],
['control', 'pnrnfc', '4'],
['control', 'pnrnfc', '0'],
['control', 'pnrnfc', '0'],
['control', 'pnrnfc', '0'],
['control', 'pnrnfc', '0'],
['control', 'pnrnfc', '0'],
['control', 'pnrnfc', '0'],
['control', 'pnrnfc', '0'],
['control', 'pnrnfc', '0'],
['control', 'pnrnfc', '0'],
['control', 'pnrnfc', '0'],
['control', 'pnrnfc', '0'],
['control', 'pnrnfc', '0'],
['control', 'pnrstop', '18'],
['control', 'pnrstart', '3'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '3'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '4'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '2'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrpnbr', '0'],
['control', 'pnrstop', '36'],
['eof', '1', '0']
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
\pnrstart0
\pnrxst0\pnrxst5\pnrxst0\pnrxst1\pnrxst0\pnrxst45\pnrxst0\pnrxst2\pnrxst0\pnrxst3\pnrxst0\pnrxst46
\pnrstop12

\pnrstart1
\pnrrgb1\pnrrgb3\pnrrgb4
\pnrrgb0\pnrrgb0\pnrrgb0
\pnrrgb0\pnrrgb0\pnrrgb0
\pnrstop9

\pnrstart2
\pnrnfc0\pnrnfc0\pnrnfc0\pnrnfc0\pnrnfc0\pnrnfc4
\pnrnfc0\pnrnfc0\pnrnfc0\pnrnfc0\pnrnfc0\pnrnfc0
\pnrnfc0\pnrnfc0\pnrnfc0\pnrnfc0\pnrnfc0\pnrnfc0
\pnrstop18

\pnrstart3
\pnrpnbr0\pnrpnbr0\pnrpnbr0\pnrpnbr3
\pnrpnbr0\pnrpnbr0\pnrpnbr0\pnrpnbr4
\pnrpnbr0\pnrpnbr0\pnrpnbr0\pnrpnbr2
\pnrpnbr0\pnrpnbr0\pnrpnbr0\pnrpnbr0 
\pnrpnbr0\pnrpnbr0\pnrpnbr0\pnrpnbr0
\pnrpnbr0\pnrpnbr0\pnrpnbr0\pnrpnbr0
\pnrpnbr0\pnrpnbr0\pnrpnbr0\pnrpnbr0
\pnrpnbr0\pnrpnbr0\pnrpnbr0\pnrpnbr0
\pnrpnbr0\pnrpnbr0\pnrpnbr0\pnrpnbr0
\pnrstop36
