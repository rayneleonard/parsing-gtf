#!/usr/bin/env perl

# SECOND PROGRAM
# open the first output file that was split by tabs. 
# this will be split by spaces
# printed into separate outputs to make sure everything is kosher

open(GTFFILE, 'geneoutput.txt') || die "NOPE\n";
open(OUTPUT, '>final_output.txt') || die "NOPE";
open(OUTPUT2, '>final_output_ei.txt') || die "NOPE";
open(OUTPUT3, '>final_output_gb.txt') || die "NOPE";
open(OUTPUT4, '>final_output_cc.txt') || die "NOPE";
open(OUTPUT5, '>final_output_en.txt') || die "NOPE";

my @line;

$ei = exon_id;
$gb = gene_biotype;
$en = exon_number;
$cc = ccds_id;

while(<GTFFILE>){
    @line = split(' ',$_); #splitting by space
    #print "$line[0]   $line[3]    $line[5]   $line[7]   $line[9]\n\n";
    
    
#         start if/else statements
    
#     if row starts with exon_id, print columns 8 and 10




    if ($line[0] =~ /$ei/){
    	print OUTPUT2 "$line[7] $line[9]\n";
    } elsif ($line[0] =~ /$gb/){
    	print OUTPUT3 "$line[3] $line[5]\n";
    } elsif ($line[0] =~ /$cc/){
			if ($line[2] =~ /$en/) {
				print OUTPUT4"$line[7] $line[9]\n";
				}
			if ($line[2] =~ /$ei/){
				print OUTPUT4"$line[9] $line[11]\n";
				}
			if ($line[2] =~ /$gb/){
				print OUTPUT4"$line[5] $line[7]\n";
				}
	} elsif ($line[0] =~ /$en/){
    	print OUTPUT5 "$line[5] $line[7]\n";
    } else {
    	print "Error, doesn't follow pattern.\n\n";
    }
}