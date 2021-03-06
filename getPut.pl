#!/usr/bin/perl
########################################################
#
#   getPut
#
#   Author: Dan Willoughby
#
#   Usage: getPut -h (prints usage information)
#
#########################################################

use strict;
use warnings;
use Data::Dumper;
use Getopt::Std;
use Cwd;
use File::Find;
use File::Copy;


my $cwd = getcwd();
my %opts;
getopts('ghp', \%opts);
my $get = $opts{'g'};
my $put = $opts{'p'};

die "Cannot use options g and p at the same time.\n" if $get and $put; 

print usage() and exit(0) if $opts{'h'};

die "A directory must be specified. Run \'-h\' for help.\n" and exit unless defined $ARGV[0];

my $filepath = $ARGV[0];

opendir my $dir, $cwd or die "Cannot open directory: $!";
# read the .v files from the current working directory
my @gitFiles = grep { /^[^\s]*\.v$/i } readdir $dir; 
closedir $dir;

die "No .v files were found in the current directory. \nAre you sure you are in the right place?" unless $#gitFiles > 0;

print "Located files in current directory: ", join(", ", @gitFiles), "\n\n";

my %labFiles = (); # key is the name of the file, value is the path and name of the file
                   # e.g. key = ALU.v; value = /path/to/file/ALU.v
find(sub {$labFiles{$_} = $File::Find::name if m/^[^\s]*\.v$/}, $filepath); # finds the files and puts into hash

if ($put) {
  foreach my $file (@gitFiles) {
    if (exists $labFiles{$file}) {
      print "Replacing $labFiles{$file} with <cwd>/$file. \n";
      copy("$cwd/$file", "$labFiles{$file}") or die "Copy failed: $!";
    }
    else {
      print " ** $file was not recursively found in $filepath.\n";
    }
  }
}
elsif ($get) {
  foreach my $file (keys %labFiles) {
    if (exists $labFiles{$file}) {
      print "Replacing <cwd>/$file with $labFiles{$file}.\n";
      copy("$labFiles{$file}","$cwd/$file") or die "Copy failed: $!";
    }
    else {
      print " ** $file was not recursively found in $filepath.\n";
    }
  }
}



sub usage {
  return '
  Description:

      getPut, will pull or push .v files (verilog module) from or to the 
      current or specified directory, respectively. 

      The files must already exist in the xilinx projects, so new files will
      need to be created before getPut will replace the source in the xilinx project
      directory. getPut will pull new .v files created in a Xilinx project.

      Caution: There is no prompt message to confirm replacing a file, be careful that -g
               and -p are used in the correct order.

  Usage: getPut [-ghp] <directory>


    Where: <directory> is the location of the root folders of the xilinx projects
           containing the .v files.

           Example: When replacing ALU.v (located in lab1) the directory passed
                    as a parameter would be "path/to/root/folder/ece3710/", because
                    ece3710 contains lab1.

  Options: 
          
            -g  Replaces (gets) the files in the current directory (.git repository), with the
                xilinx projects files with the same name.

            -h  Displays this help message

            -p  Replaces (puts) the files in the xilinx projects with the current directory
                (git repository) files with the same name.

'
}



      
