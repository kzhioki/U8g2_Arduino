#!/usr/bin/perl

#
# Usage:
#  $ perl split_fonts.pl u8g2_fonts.c
#  $ perl split_fonts.pl u8x8_fonts.c
#

while (<>) {
  if (/^\#include /) {
    $include = $_;
  }

  if (/_FONT_SECTION\(\"(\w+)\"\)/) {
    $fn = $1 . ".c";
    printf("$fn\n");
    system("mv ./hoge.c $fn");
    close(FILE);
    open(FILE, ">>$fn");
  }
  if (/^\/\*/) {
    close(FILE);
    $fn = "./hoge.c";
    open(FILE, ">$fn");
    print FILE $include
  }
  print FILE $_;
}
close(FILE);
