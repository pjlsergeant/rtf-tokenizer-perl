use strict;
use Test::More tests => 192;
use RTF::Tokenizer;

my $DEBUG = 0; 
my @tokens = (
['group', '1', ''],
['control', 'info', ''],
['group', '1', ''],
['control', 'title', ''],
['text', 'Template', ''],
['group', '0', ''],
['group', '1', ''],
['control', 'author', ''],
['text', 'John Doe', ''],
['group', '0', ''],
['group', '1', ''],
['control', 'operator', ''],
['text', 'JOHN DOE', ''],
['group', '0', ''],
['group', '1', ''],
['control', 'creatim', ''],
['control', 'yr', '1999'],
['control', 'mo', '4'],
['control', 'dy', '27'],
['control', 'min', '1'],
['group', '0', ''],
['group', '1', ''],
['control', 'revtim', ''],
['control', 'yr', '1999'],
['control', 'mo', '4'],
['control', 'dy', '27'],
['control', 'min', '1'],
['group', '0', ''],
['group', '1', ''],
['control', 'printim', ''],
['control', 'yr', '1999'],
['control', 'mo', '3'],
['control', 'dy', '17'],
['control', 'hr', '23'],
['control', 'min', '5'],
['group', '0', ''],
['group', '1', ''],
['control', 'version', '2'],
['group', '0', ''],
['group', '1', ''],
['control', 'edmins', '2'],
['group', '0', ''],
['group', '1', ''],
['control', 'nofpages', '183'],
['group', '0', ''],
['group', '1', ''],
['control', 'nofwords', '53170'],
['group', '0', ''],
['group', '1', ''],
['control', 'nofchars', '303071'],
['group', '0', ''],
['group', '1', ''],
['control', '*', ''],
['control', 'company', ''],
['text', 'Microsoft', ''],
['group', '0', ''],
['group', '1', ''],
['control', 'nofcharsws', '372192'],
['group', '0', ''],
['group', '1', ''],
['control', 'vern', '8247'],
['group', '0', ''],
['group', '0', ''],
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
{\info{\title Template}{\author John Doe}{\operator JOHN DOE}{\creatim\yr1999\mo4\dy27\min1}{\revtim\yr1999\mo4\dy27\min1}{\printim\yr1999\mo3\dy17\hr23\min5}{\version2}{\edmins2}{\nofpages183}{\nofwords53170}{\nofchars303071}{\*\company Microsoft}{\nofcharsws372192}{\vern8247}}