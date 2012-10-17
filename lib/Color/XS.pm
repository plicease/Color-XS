package Color::XS;

use strict;
use warnings;

our @ISA = qw( Color::XS::Color );

# ABSTRACT: example color class written using Inline::CPP
BEGIN {
# VERSION
}

=head1 SYNOPSIS

 my $color = Color::XS->new(255,255,0255); # same as Color::XS->white;
 $color->set_green(75);
 $color->set_blue(100);
 say "red is ", $color->get_red;
 say "green is ", $color->get_green;
 say "blue is ", $color->get_blue;

=head1 DESCRIPTION

This module is intended as an example to allow me to experiment
with L<Inline> and L<Inline::CPP>.  It isn't intended to be useful.

Objects of this class represent a color stored as three 8-bit color
channel values, red, green and blue.

=head1 CONSTRUCTOR

To create an instance of this class, you can use new, or one of the
convenience methods.  If you use new you must provide an integer 
triplet of the red, green and blue values.

 my $color = Color::XS->new(0x7f,0xff,0x00);
 my $red = Color::XS->red;
 my $green = Color::XS->green;
 my $blue = Color::XS->blue;

=head1 METHODS

=head2 $color-E<gt>get_red

Return the red color channel as an 8-bit value.

=head2 $color-E<gt>get_green

Return the green color channel as an 8-bit value.

=head2 $color-E<gt>get_blue

Return the blue color channel as an 8-bit value.

=head1 CAVEATS

It's just an example for testing, it isn't really useful for
anything.

=cut

use Inline
  CPP     => 'DATA',
  NAME    => 'Color::XS',
  defined $Color::XS::VERSION ? (VERSION => $Color::XS::VERSION ) : ();

END { Inline->init; }

package
  Color::XS::Color;

package Color::XS;

1;

__DATA__
__CPP__
using namespace std;

class Color {

public:
  Color(int, int, int);
  ~Color();
  
  int get_red() { return _red; }
  int get_green() { return _green; }
  int get_blue() { return _blue; }
  
  void set_red(int);
  void set_green(int);
  void set_blue(int);

  static Color *red()   { return new Color(255,0,0); }
  static Color *green() { return new Color(0,255,0); }
  static Color *blue()  { return new Color(0,0,255); }
  static Color *white() { return new Color(0xff,0xff,0xff); }
  static Color *black() { return new Color(0x00,0x00,0x00); }

private:
  int _red, _green, _blue;
};

Color::Color(int r, int g, int b) : _red(r), _green(g), _blue(b)
{
}

Color::~Color()
{
}

void Color::set_red(int r)
{
#ifdef dVAR
  dVAR; dXSARGS;
#else
  dXSARGS;
#endif
  _red = r;
  XSRETURN(1);        
}

void Color::set_green(int g)
{
#ifdef dVAR
  dVAR; dXSARGS;
#else
  dXSARGS;
#endif
  _green = g;
  XSRETURN(1);        
}

void Color::set_blue(int b)
{
#ifdef dVAR
  dVAR; dXSARGS;
#else
  dXSARGS;
#endif
  _blue = b;
  XSRETURN(1);        
}
