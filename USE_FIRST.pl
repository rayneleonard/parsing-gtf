#!/usr/bin/env perl

# open the gtf file
# split by tab then put the column I want into output file to be split in another program
# for whatever reason doing both in one program fucked everything

open(GTFFILE, 'genes.gtf') || die "NOPE";
open(OUTPUT, '>geneoutput.txt') || die "NOPE";


my @line;



while(<GTFFILE>){
    @line = split(/\t/,$_); #splitting by tab
    
    print OUTPUT "$line[8]"; #that printed what I wanted
    
#     $line[8] = split(/ +/);
#     print "$line[8]\n\n";
    #@array1=$line[8]; #assigning column 8 to another array
    #print "$array1[0]\n\n"; #that prints what I want too. 

}

