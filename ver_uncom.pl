#!/usr/bin/perl
#******************************************************************
#
#
# ver_uncom.pl
#
#******************************************************************
#
# created on:	20/08/2020
# created by:	aman_altaf
# last edit on:	$DateTime: $
# last edit by:	$Author: $
# revision:	    $Revision: $
# comments:	    Generated
#
#******************************************************************
# Revision List:
#
#		1.0	20/08/2020	Initial release
#
#******************************************************************
#                       Verilog Uncomment
#
#  This utility is intended to make Uncommenting the Verilog_file(*.v)
#  easier.This utility supports the following options:
#
#
#	      Usage: ver_uncom.pl [-h]  [-o <FILE> <FILE>]
#
#    help       -h                           Print this help message.
#    other      -o <IN_FILE> <OUT_FILE>      Uncommenting the (In)verilog file and saving in (In)verilog file.
#
# Example of Module Instantiation:
#
#	  ver_uncom.pl -o in.v out.v
#
#******************************************************************
#
#  Copyright (c) 2020, Aman Altaf
#  All rights reserved.
#
#  Feel free to redistribute , edit and use in source and binary form, with
#  or without modification(s).
#
#
#******************************************************************
if ($ARGV[0] eq '-h') {print_usage();}

elsif ($ARGV[0] eq '-c') {
$in=$ARGV[1];
$out=$ARGV[2];

open(IN,'<',$in) or die ("can't open the file $in.\nError : $! ");
open(OUT,'>',$out) or die ("can't open the file $out.\nError : $! ");
$ms=0;
while (defined ($line=<IN>)){
$line =~s/\/\*.*\*\///;
$line =~s/\/\/.*//;
if ($line=~/\/\*/){$ms=1;$line =~s/\/\*.*//;}
if ($line=~/.*?\*\//){$line =~s/.*?\*\///;$ms=0;$mk=0;}
if (($mk==1)&&($ms==1)&&($line!~/([^\*][^\/])*\*\//)){$line =~s/.*//;}
if ($line=~/.+?/) {print (OUT $line);}
$mk=1 if $ms==1;
}
close (IN) or die ("can't close the file $in: $!" );
close (OUT) or die ("can't close the file $out: $!" )
}
else{print_usage();}



sub print_usage {
    my ($usage);
    $usage  = "Verilog Uncomment \n";
    $usage .= "\nThis utility is intended to make Uncommenting the Verilog_file(*.v) easier.This utility supports the following options:\n";
    $usage .= "\n";
    $usage  = "\n\tUsage: ver_uncom.pl [-h]  [-c <FILE> <FILE>] \n";
    $usage .= "\n    help       -h                           Print this help message.\n";
    $usage .= "    other      -c <IN_FILE> <OUT_FILE>      Uncommenting the (In)verilog file and saving in (In)verilog file.\n";
    $usage .= "\n Example of Module Instantiation:\n";
    $usage .= "\n";
    $usage .= "\tver_uncom.pl -c in.v out.v \n";
    $usage .= "\n";
    print($usage);

}