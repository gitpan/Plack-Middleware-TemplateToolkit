
use strict;
use warnings;

use 5.008_001;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Serve files with Template Toolkit and Plack',
  'AUTHOR' => 'Leo Lapworth, Jakob Voss',
  'BUILD_REQUIRES' => {
    'File::Spec' => '0',
    'HTTP::Request' => '0',
    'HTTP::Request::Common' => '0',
    'Plack::Builder' => '0',
    'Plack::Middleware::ErrorDocument' => '0',
    'Plack::Test' => '0',
    'Test::More' => '0.98',
    'Test::Warn' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'Plack-Middleware-TemplateToolkit',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Plack::Middleware::TemplateToolkit',
  'PREREQ_PM' => {
    'Carp' => '0',
    'Encode' => '0',
    'HTTP::Status' => '0',
    'Plack::MIME' => '0',
    'Plack::Middleware' => '0',
    'Plack::Middleware::Debug::Base' => '0',
    'Plack::Request' => '0.994',
    'Plack::Util::Accessor' => '0',
    'Scalar::Util' => '0',
    'Template' => '2',
    'parent' => '0'
  },
  'VERSION' => '0.2',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


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



