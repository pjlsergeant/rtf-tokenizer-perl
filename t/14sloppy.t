use strict;
use Test::More tests => 12;
use RTF::Tokenizer;


my $tokenizer = RTF::Tokenizer->new();

# These are tests to check that control-word delimiters are handled 
# as the specification says, as I've screwed this up once, and 
# chromatic says add tests for bugs you find, to stop them creeping
# back in.

$tokenizer->read_string(q?\rtf1a}asdf?);

# Try and break stuff a bit
diag("Expect an error message here:\n");
$tokenizer->get_token();

ok( eq_array( [$tokenizer->get_token()], ['group', '0', ''] ), 'End of group' );
ok( eq_array( [$tokenizer->get_token()], ['text', 'asdf', ''] ), 'end text read correctly' );

# Set sloppy, and make sure we /don't/ break anything...
$tokenizer = RTF::Tokenizer->new( sloppy => 1 );
$tokenizer->read_string(q?\rtf1a}asdf?);

ok( eq_array( [$tokenizer->get_token()], ['control', 'rtf', '1'] ), 'RTF control read correctly' );
ok( eq_array( [$tokenizer->get_token()], ['text', 'a', ''] ), 'next text read correctly' );
ok( eq_array( [$tokenizer->get_token()], ['group', '0', ''] ), 'End of group' );
ok( eq_array( [$tokenizer->get_token()], ['text', 'asdf', ''] ), 'end text read correctly' );

diag("Expect yet another 'error' here...");

$tokenizer->sloppy( 0 );
$tokenizer->read_string(q?\rtf1a}asdf?);

# Try and break stuff a bit
$tokenizer->get_token();

ok( eq_array( [$tokenizer->get_token()], ['group', '0', ''] ), 'End of group' );
ok( eq_array( [$tokenizer->get_token()], ['text', 'asdf', ''] ), 'end text read correctly' );

# And again, with feeling...
$tokenizer->sloppy(1);


$tokenizer->read_string(q?\rtf1a}asdf?);ok( eq_array( [$tokenizer->get_token()], ['control', 'rtf', '1'] ), 'RTF control read correctly' );ok( eq_array( [$tokenizer->get_token()], ['text', 'a', ''] ), 'next text read correctly' );ok( eq_array( [$tokenizer->get_token()], ['group', '0', ''] ), 'End of group' );
ok( eq_array( [$tokenizer->get_token()], ['text', 'asdf', ''] ), 'end text read correctly' );

