use strict;
use warnings;
use Inline::MakeMaker 0.45;
use File::Spec;

##{ $share_dir_code{preamble} || '' ##}
 
my ##{ 
  my $write_makefile_args = $plugin->write_makefile_args;
  delete $write_makefile_args->{MIN_PERL_VERSION};
   my $makefile_args_dumper = Data::Dumper->new(
     [ $write_makefile_args ],
     [ '*WriteMakefileArgs' ],
   );
   $makefile_args_dumper->Sortkeys( 1 );
   $makefile_args_dumper->Indent( 1 );
   $makefile_args_dumper->Useqq( 1 );
   $makefile_args_dumper->Dump;
##} 
    
unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}
 
delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };
 
WriteMakefile(%WriteMakefileArgs);
 
##{ $share_dir_code{postamble} || '' ##}

