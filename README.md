# Color::XS

example color class written using Inline::CPP

# SYNOPSIS

    my $color = Color::XS->new(255,255,255); # same as Color::XS->white;
    $color->set_green(75);
    $color->set_blue(100);
    say "red is ", $color->get_red;
    say "green is ", $color->get_green;
    say "blue is ", $color->get_blue;

# DESCRIPTION

This module is intended as an example to allow me to experiment
with [Inline](https://metacpan.org/pod/Inline) and [Inline::CPP](https://metacpan.org/pod/Inline::CPP).  It isn't intended to be useful.

Objects of this class represent a color stored as three 8-bit color
channel values, red, green and blue.

# CONSTRUCTOR

To create an instance of this class, you can use new, or one of the
convenience methods.  If you use new you must provide an integer 
triplet of the red, green and blue values.

    my $color = Color::XS->new(0x7f,0xff,0x00);
    my $red = Color::XS->red;
    my $green = Color::XS->green;
    my $blue = Color::XS->blue;

# METHODS

## $color->get\_red

Return the red color channel as an 8-bit value.

## $color->get\_green

Return the green color channel as an 8-bit value.

## $color->get\_blue

Return the blue color channel as an 8-bit value.

# CAVEATS

It's just an example for testing, it isn't really useful for
anything.

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
