package inc::MakeMaker;

use Moose;
use namespace::autoclean;
use v5.10;

with 'Dist::Zilla::Role::InstallTool';

sub setup_installer
{
  my($self) = @_;
  
  my($makefile) = grep { $_->name eq 'Makefile.PL' } @{ $self->zilla->files };
  
  my $content = $makefile->content;
  
  # use ExtUtils::MakeMaker 6.30;
  # becomes
  # use Inline::MakeMaker 0.45;

  if($content =~ s{use ExtUtils::MakeMaker \d+\.\d+;}{use Inline::MakeMaker 0.45;}m)
  {
    $makefile->content($content);
    $self->zilla->log("Modified Makefile.PL to use Inline::MakeMaker");
  }
  else
  {
    $self->zilla->log_fatal("unable to update Makefile.PL");
  }
}

1;



