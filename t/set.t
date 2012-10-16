use strict;
use warnings;
use Test::More tests => 4;
use Color::XS;

my $color = eval { Color::XS->black };
diag $@ if $@;
isa_ok $color, 'Color::XS';

$color->set_red(25)
      ->set_green(50)
      ->set_blue(75);

is $color->get_red,   25, 'red   = 25';
is $color->get_green, 50, 'green = 50';
is $color->get_blue,  75, 'blue  = 75';
