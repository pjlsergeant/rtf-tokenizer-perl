use strict;
use Test::More tests => 1761;
use RTF::Tokenizer;

my $DEBUG = 0; 
my @tokens = (
['control', 'trowd', ''],
['control', 'trgaph', '115'],
['control', 'trleft', '388'],
['control', 'trbrdrt', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrl', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrb', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrr', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrh', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrv', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'tphmrg', ''],
['control', 'tposxc', ''],
['control', 'tposyc', ''],
['control', 'tdfrmtxtLeft', '187'],
['control', 'tdfrmtxtRight', '187'],
['control', 'trftsWidth', '1'],
['control', 'trftsWidthB', '3'],
['control', 'trwWidthB', '504'],
['control', 'trftsWidthA', '3'],
['control', 'trautofit', '1'],
['control', 'trspdl', '14'],
['control', 'trspdt', '14'],
['control', 'trspdb', '14'],
['control', 'trspdr', '14'],
['control', 'trspdfl', '3'],
['control', 'trspdft', '3'],
['control', 'trspdfb', '3'],
['control', 'trspdfr', '3'],
['control', 'trpaddl', '115'],
['control', 'trpaddr', '115'],
['control', 'trpaddfl', '3'],
['control', 'trpaddfr', '3'],
['control', 'clvertalc', ''],
['control', 'clbrdrt', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'clbrdrl', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'clbrdrb', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'clbrdrr', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'clcbpat', '17'],
['control', 'cltxlrtb', ''],
['control', 'clftsWidth', '3'],
['control', 'clwWidth', '4644'],
['control', 'cellx', '5074'],
['control', 'pard', ''],
['control', 'plain', ''],
['control', 'qc', ''],
['control', 'li', '0'],
['control', 'ri', '0'],
['control', 'widctlpar', ''],
['control', 'intbl', ''],
['control', 'phmrg', ''],
['control', 'posxc', ''],
['control', 'posyc', ''],
['control', 'dxfrtext', '187'],
['control', 'dfrmtxtx', '187'],
['control', 'dfrmtxty', '0'],
['control', 'aspalpha', ''],
['control', 'aspnum', ''],
['control', 'faauto', ''],
['control', 'adjustright', ''],
['control', 'rin', '0'],
['control', 'lin', '0'],
['control', 'fs', '24'],
['control', 'lang', '1033'],
['control', 'langfe', '2052'],
['control', 'loch', ''],
['control', 'af', '0'],
['control', 'hich', ''],
['control', 'af', '0'],
['control', 'dbch', ''],
['control', 'af', '17'],
['control', 'cgrid', ''],
['control', 'langnp', '1033'],
['control', 'langfenp', '2052'],
['group', '1', ''],
['control', 'hich', ''],
['control', 'af', '0'],
['control', 'dbch', ''],
['control', 'af', '17'],
['control', 'loch', ''],
['control', 'f', '0'],
['text', 'CELL ONE', ''],
['control', 'par', ''],
['group', '0', ''],
['control', 'pard', ''],
['control', 'qc', ''],
['control', 'li', '0'],
['control', 'ri', '0'],
['control', 'widctlpar', ''],
['control', 'intbl', ''],
['control', 'phmrg', ''],
['control', 'posxc', ''],
['control', 'posyc', ''],
['control', 'dxfrtext', '187'],
['control', 'dfrmtxtx', '187'],
['control', 'dfrmtxty', '0'],
['control', 'aspalpha', ''],
['control', 'aspnum', ''],
['control', 'faauto', ''],
['control', 'adjustright', ''],
['control', 'rin', '0'],
['control', 'lin', '0'],
['control', 'itap', '2'],
['group', '1', ''],
['control', 'hich', ''],
['control', 'af', '0'],
['control', 'dbch', ''],
['control', 'af', '17'],
['control', 'loch', ''],
['control', 'f', '0'],
['text', 'NESTED TABLE', ''],
['control', 'nestcell', ''],
['group', '1', ''],
['control', 'nonesttables', ''],
['control', 'par', ''],
['group', '0', ''],
['group', '0', ''],
['control', 'pard', ''],
['control', 'ql', ''],
['control', 'li', '0'],
['control', 'ri', '0'],
['control', 'widctlpar', ''],
['control', 'intbl', ''],
['control', 'aspalpha', ''],
['control', 'aspnum', ''],
['control', 'faauto', ''],
['control', 'adjustright', ''],
['control', 'rin', '0'],
['control', 'lin', '0'],
['control', 'itap', '2'],
['group', '1', ''],
['group', '1', ''],
['control', '*', ''],
['control', 'nesttableprops', ''],
['control', 'trowd', ''],
['control', 'trgaph', '108'],
['control', 'trleft', '8'],
['control', 'trbrdrt', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrl', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrb', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrr', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrh', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrv', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trftsWidth', '1'],
['control', 'trautofit', '1'],
['control', 'trpaddl', '108'],
['control', 'trpaddr', '108'],
['control', 'trpaddfl', '3'],
['control', 'trpaddfr', '3'],
['control', 'clvertalt', ''],
['control', 'clbrdrt', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'clbrdrl', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'clbrdrb', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'clbrdrr', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'cltxlrtb', ''],
['control', 'clftsWidth', '3'],
['control', 'clwWidth', '2340'],
['control', 'cellx', '2348'],
['control', 'nestrow', ''],
['group', '0', ''],
['group', '1', ''],
['control', 'nonesttables', ''],
['control', 'par', ''],
['group', '0', ''],
['group', '0', ''],
['control', 'trowd', ''],
['control', 'trgaph', '115'],
['control', 'trleft', '388'],
['control', 'trbrdrt', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrl', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrb', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrr', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrh', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrv', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'tphmrg', ''],
['control', 'tposxc', ''],
['control', 'tposyc', ''],
['control', 'tdfrmtxtLeft', '187'],
['control', 'tdfrmtxtRight', '187'],
['control', 'trftsWidth', '1'],
['control', 'trftsWidthB', '3'],
['control', 'trwWidthB', '504'],
['control', 'trftsWidthA', '3'],
['control', 'trautofit', '1'],
['control', 'trspdl', '14'],
['control', 'trspdt', '14'],
['control', 'trspdb', '14'],
['control', 'trspdr', '14'],
['control', 'trspdfl', '3'],
['control', 'trspdft', '3'],
['control', 'trspdfb', '3'],
['control', 'trspdfr', '3'],
['control', 'trpaddl', '115'],
['control', 'trpaddr', '115'],
['control', 'trpaddfl', '3'],
['control', 'trpaddfr', '3'],
['control', 'clvertalc', ''],
['control', 'clbrdrt', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'clbrdrl', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'clbrdrb', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'clbrdrr', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'clcbpat', '17'],
['control', 'cltxlrtb', ''],
['control', 'clftsWidth', '3'],
['control', 'clwWidth', '4644'],
['control', 'cellx', '5074'],
['control', 'pard', ''],
['control', 'qc', ''],
['control', 'li', '0'],
['control', 'ri', '0'],
['control', 'widctlpar', ''],
['control', 'intbl', ''],
['control', 'phmrg', ''],
['control', 'posxc', ''],
['control', 'posyc', ''],
['control', 'dxfrtext', '187'],
['control', 'dfrmtxtx', '187'],
['control', 'dfrmtxty', '0'],
['control', 'aspalpha', ''],
['control', 'aspnum', ''],
['control', 'faauto', ''],
['control', 'adjustright', ''],
['control', 'rin', '0'],
['control', 'lin', '0'],
['group', '1', ''],
['control', 'cell', ''],
['group', '0', ''],
['control', 'pard', ''],
['control', 'ql', ''],
['control', 'li', '0'],
['control', 'ri', '0'],
['control', 'widctlpar', ''],
['control', 'intbl', ''],
['control', 'aspalpha', ''],
['control', 'aspnum', ''],
['control', 'faauto', ''],
['control', 'adjustright', ''],
['control', 'rin', '0'],
['control', 'lin', '0'],
['group', '1', ''],
['control', 'trowd', ''],
['control', 'trgaph', '115'],
['control', 'trleft', '388'],
['control', 'trbrdrt', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrl', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrb', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrr', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrh', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrv', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'tphmrg', ''],
['control', 'tposxc', ''],
['control', 'tposyc', ''],
['control', 'tdfrmtxtLeft', '187'],
['control', 'tdfrmtxtRight', '187'],
['control', 'trftsWidth', '1'],
['control', 'trftsWidthB', '3'],
['control', 'trwWidthB', '504'],
['control', 'trftsWidthA', '3'],
['control', 'trautofit', '1'],
['control', 'trspdl', '14'],
['control', 'trspdt', '14'],
['control', 'trspdb', '14'],
['control', 'trspdr', '14'],
['control', 'trspdfl', '3'],
['control', 'trspdft', '3'],
['control', 'trspdfb', '3'],
['control', 'trspdfr', '3'],
['control', 'trpaddl', '115'],
['control', 'trpaddr', '115'],
['control', 'trpaddfl', '3'],
['control', 'trpaddfr', '3'],
['control', 'clvertalc', ''],
['control', 'clbrdrt', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'clbrdrl', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'clbrdrb', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'clbrdrr', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'clcbpat', '17'],
['control', 'cltxlrtb', ''],
['control', 'clftsWidth', '3'],
['control', 'clwWidth', '4644'],
['control', 'cellx', '5074'],
['control', 'row', ''],
['group', '0', ''],
['control', 'trowd', ''],
['control', 'trgaph', '115'],
['control', 'trleft', '-158'],
['control', 'trbrdrt', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrl', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrb', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrr', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrh', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrv', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'tphmrg', ''],
['control', 'tposxc', ''],
['control', 'tposyc', ''],
['control', 'tdfrmtxtLeft', '187'],
['control', 'tdfrmtxtRight', '187'],
['control', 'trftsWidth', '1'],
['control', 'trftsWidthB', '3'],
['control', 'trftsWidthA', '3'],
['control', 'trwWidthA', '900'],
['control', 'trautofit', '1'],
['control', 'trspdl', '14'],
['control', 'trspdt', '14'],
['control', 'trspdb', '14'],
['control', 'trspdr', '14'],
['control', 'trspdfl', '3'],
['control', 'trspdft', '3'],
['control', 'trspdfb', '3'],
['control', 'trspdfr', '3'],
['control', 'trpaddl', '115'],
['control', 'trpaddr', '115'],
['control', 'trpaddfl', '3'],
['control', 'trpaddfr', '3'],
['control', 'clvertalt', ''],
['control', 'clbrdrt', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'clbrdrl', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'clbrdrb', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'clbrdrr', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'clcbpat', '17'],
['control', 'cltxlrtb', ''],
['control', 'clftsWidth', '3'],
['control', 'clwWidth', '4248'],
['control', 'cellx', '4132'],
['control', 'pard', ''],
['control', 'ql', ''],
['control', 'li', '0'],
['control', 'ri', '0'],
['control', 'widctlpar', ''],
['control', 'intbl', ''],
['control', 'phmrg', ''],
['control', 'posxc', ''],
['control', 'posyc', ''],
['control', 'dxfrtext', '187'],
['control', 'dfrmtxtx', '187'],
['control', 'dfrmtxty', '0'],
['control', 'aspalpha', ''],
['control', 'aspnum', ''],
['control', 'faauto', ''],
['control', 'adjustright', ''],
['control', 'rin', '0'],
['control', 'lin', '0'],
['group', '1', ''],
['control', 'hich', ''],
['control', 'af', '0'],
['control', 'dbch', ''],
['control', 'af', '17'],
['control', 'loch', ''],
['control', 'f', '0'],
['text', 'CELL TWO', ''],
['control', 'cell', ''],
['group', '0', ''],
['control', 'pard', ''],
['control', 'ql', ''],
['control', 'li', '0'],
['control', 'ri', '0'],
['control', 'widctlpar', ''],
['control', 'intbl', ''],
['control', 'aspalpha', ''],
['control', 'aspnum', ''],
['control', 'faauto', ''],
['control', 'adjustright', ''],
['control', 'rin', '0'],
['control', 'lin', '0'],
['group', '1', ''],
['control', 'trowd', ''],
['control', 'trgaph', '115'],
['control', 'trleft', '-158'],
['control', 'trbrdrt', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrl', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrb', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrr', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrh', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'trbrdrv', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'tphmrg', ''],
['control', 'tposxc', ''],
['control', 'tposyc', ''],
['control', 'tdfrmtxtLeft', '187'],
['control', 'tdfrmtxtRight', '187'],
['control', 'trftsWidth', '1'],
['control', 'trftsWidthB', '3'],
['control', 'trftsWidthA', '3'],
['control', 'trwWidthA', '900'],
['control', 'trautofit', '1'],
['control', 'trspdl', '14'],
['control', 'trspdt', '14'],
['control', 'trspdb', '14'],
['control', 'trspdr', '14'],
['control', 'trspdfl', '3'],
['control', 'trspdft', '3'],
['control', 'trspdfb', '3'],
['control', 'trspdfr', '3'],
['control', 'trpaddl', '115'],
['control', 'trpaddr', '115'],
['control', 'trpaddfl', '3'],
['control', 'trpaddfr', '3'],
['control', 'clvertalt', ''],
['control', 'clbrdrt', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'clbrdrl', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'clbrdrb', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'clbrdrr', ''],
['control', 'brdrs', ''],
['control', 'brdrw', '15'],
['control', 'brdrcf', '11'],
['control', 'clcbpat', '17'],
['control', 'cltxlrtb', ''],
['control', 'clftsWidth', '3'],
['control', 'clwWidth', '4248'],
['control', 'cellx', '4132'],
['control', 'row', ''],
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
\trowd \trgaph115\trleft388\trbrdrt\brdrs\brdrw15\brdrcf11 \trbrdrl\brdrs\brdrw15\brdrcf11 \trbrdrb\brdrs\brdrw15\brdrcf11 \trbrdrr\brdrs\brdrw15\brdrcf11 
\trbrdrh\brdrs\brdrw15\brdrcf11 \trbrdrv\brdrs\brdrw15\brdrcf11 
\tphmrg\tposxc\tposyc\tdfrmtxtLeft187\tdfrmtxtRight187\trftsWidth1\trftsWidthB3\trwWidthB504\trftsWidthA3\trautofit1\trspdl14\trspdt14\trspdb14\trspdr14\trspdfl3\trspdft3\trspdfb3\trspdfr3\trpaddl115\trpaddr115\trpaddfl3\trpaddfr3 \clvertalc\clbrdrt
\brdrs\brdrw15\brdrcf11 \clbrdrl\brdrs\brdrw15\brdrcf11 \clbrdrb\brdrs\brdrw15\brdrcf11 \clbrdrr\brdrs\brdrw15\brdrcf11 \clcbpat17\cltxlrtb\clftsWidth3\clwWidth4644 \cellx5074\pard\plain 
\qc \li0\ri0\widctlpar\intbl\phmrg\posxc\posyc\dxfrtext187\dfrmtxtx187\dfrmtxty0\aspalpha\aspnum\faauto\adjustright\rin0\lin0 \fs24\lang1033\langfe2052\loch\af0\hich\af0\dbch\af17\cgrid\langnp1033\langfenp2052 {\hich\af0\dbch\af17\loch\f0 CELL ONE
\par }\pard \qc \li0\ri0\widctlpar\intbl\phmrg\posxc\posyc\dxfrtext187\dfrmtxtx187\dfrmtxty0\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap2 {\hich\af0\dbch\af17\loch\f0 NESTED TABLE\nestcell{\nonesttables
\par }}\pard \ql \li0\ri0\widctlpar\intbl\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap2 {{\*\nesttableprops\trowd \trgaph108\trleft8\trbrdrt\brdrs\brdrw15\brdrcf11 \trbrdrl\brdrs\brdrw15\brdrcf11 \trbrdrb\brdrs\brdrw15\brdrcf11 \trbrdrr
\brdrs\brdrw15\brdrcf11 \trbrdrh\brdrs\brdrw15\brdrcf11 \trbrdrv\brdrs\brdrw15\brdrcf11 \trftsWidth1\trautofit1\trpaddl108\trpaddr108\trpaddfl3\trpaddfr3 \clvertalt\clbrdrt\brdrs\brdrw15\brdrcf11 \clbrdrl\brdrs\brdrw15\brdrcf11 \clbrdrb
\brdrs\brdrw15\brdrcf11 \clbrdrr\brdrs\brdrw15\brdrcf11 \cltxlrtb\clftsWidth3\clwWidth2340 \cellx2348\nestrow}{\nonesttables
\par }}\trowd \trgaph115\trleft388\trbrdrt\brdrs\brdrw15\brdrcf11 \trbrdrl\brdrs\brdrw15\brdrcf11 \trbrdrb\brdrs\brdrw15\brdrcf11 \trbrdrr\brdrs\brdrw15\brdrcf11 \trbrdrh\brdrs\brdrw15\brdrcf11 \trbrdrv\brdrs\brdrw15\brdrcf11 
\tphmrg\tposxc\tposyc\tdfrmtxtLeft187\tdfrmtxtRight187\trftsWidth1\trftsWidthB3\trwWidthB504\trftsWidthA3\trautofit1\trspdl14\trspdt14\trspdb14\trspdr14\trspdfl3\trspdft3\trspdfb3\trspdfr3\trpaddl115\trpaddr115\trpaddfl3\trpaddfr3 \clvertalc\clbrdrt
\brdrs\brdrw15\brdrcf11 \clbrdrl\brdrs\brdrw15\brdrcf11 \clbrdrb\brdrs\brdrw15\brdrcf11 \clbrdrr\brdrs\brdrw15\brdrcf11 \clcbpat17\cltxlrtb\clftsWidth3\clwWidth4644 \cellx5074\pard 
\qc \li0\ri0\widctlpar\intbl\phmrg\posxc\posyc\dxfrtext187\dfrmtxtx187\dfrmtxty0\aspalpha\aspnum\faauto\adjustright\rin0\lin0 {\cell }\pard \ql \li0\ri0\widctlpar\intbl\aspalpha\aspnum\faauto\adjustright\rin0\lin0 {\trowd \trgaph115\trleft388\trbrdrt
\brdrs\brdrw15\brdrcf11 \trbrdrl\brdrs\brdrw15\brdrcf11 \trbrdrb\brdrs\brdrw15\brdrcf11 \trbrdrr\brdrs\brdrw15\brdrcf11 \trbrdrh\brdrs\brdrw15\brdrcf11 \trbrdrv\brdrs\brdrw15\brdrcf11 
\tphmrg\tposxc\tposyc\tdfrmtxtLeft187\tdfrmtxtRight187\trftsWidth1\trftsWidthB3\trwWidthB504\trftsWidthA3\trautofit1\trspdl14\trspdt14\trspdb14\trspdr14\trspdfl3\trspdft3\trspdfb3\trspdfr3\trpaddl115\trpaddr115\trpaddfl3\trpaddfr3 \clvertalc\clbrdrt
\brdrs\brdrw15\brdrcf11 \clbrdrl\brdrs\brdrw15\brdrcf11 \clbrdrb\brdrs\brdrw15\brdrcf11 \clbrdrr\brdrs\brdrw15\brdrcf11 \clcbpat17\cltxlrtb\clftsWidth3\clwWidth4644 \cellx5074\row }\trowd \trgaph115\trleft-158\trbrdrt\brdrs\brdrw15\brdrcf11 \trbrdrl
\brdrs\brdrw15\brdrcf11 \trbrdrb\brdrs\brdrw15\brdrcf11 \trbrdrr\brdrs\brdrw15\brdrcf11 \trbrdrh\brdrs\brdrw15\brdrcf11 \trbrdrv\brdrs\brdrw15\brdrcf11 
\tphmrg\tposxc\tposyc\tdfrmtxtLeft187\tdfrmtxtRight187\trftsWidth1\trftsWidthB3\trftsWidthA3\trwWidthA900\trautofit1\trspdl14\trspdt14\trspdb14\trspdr14\trspdfl3\trspdft3\trspdfb3\trspdfr3\trpaddl115\trpaddr115\trpaddfl3\trpaddfr3 \clvertalt\clbrdrt
\brdrs\brdrw15\brdrcf11 \clbrdrl\brdrs\brdrw15\brdrcf11 \clbrdrb\brdrs\brdrw15\brdrcf11 \clbrdrr\brdrs\brdrw15\brdrcf11 \clcbpat17\cltxlrtb\clftsWidth3\clwWidth4248 \cellx4132\pard 
\ql \li0\ri0\widctlpar\intbl\phmrg\posxc\posyc\dxfrtext187\dfrmtxtx187\dfrmtxty0\aspalpha\aspnum\faauto\adjustright\rin0\lin0 {\hich\af0\dbch\af17\loch\f0 CELL TWO\cell }\pard \ql \li0\ri0\widctlpar\intbl\aspalpha\aspnum\faauto\adjustright\rin0\lin0 {
\trowd \trgaph115\trleft-158\trbrdrt\brdrs\brdrw15\brdrcf11 \trbrdrl\brdrs\brdrw15\brdrcf11 \trbrdrb\brdrs\brdrw15\brdrcf11 \trbrdrr\brdrs\brdrw15\brdrcf11 \trbrdrh\brdrs\brdrw15\brdrcf11 \trbrdrv\brdrs\brdrw15\brdrcf11 
\tphmrg\tposxc\tposyc\tdfrmtxtLeft187\tdfrmtxtRight187\trftsWidth1\trftsWidthB3\trftsWidthA3\trwWidthA900\trautofit1\trspdl14\trspdt14\trspdb14\trspdr14\trspdfl3\trspdft3\trspdfb3\trspdfr3\trpaddl115\trpaddr115\trpaddfl3\trpaddfr3 \clvertalt\clbrdrt
\brdrs\brdrw15\brdrcf11 \clbrdrl\brdrs\brdrw15\brdrcf11 \clbrdrb\brdrs\brdrw15\brdrcf11 \clbrdrr\brdrs\brdrw15\brdrcf11 \clcbpat17\cltxlrtb\clftsWidth3\clwWidth4248 \cellx4132\row }
