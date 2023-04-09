#!/usr/bin/perl

use strict;
use warnings;

print " Ingrese nombre del archivo:\n\n";
my $archivo = <STDIN>;
chomp $archivo;
unless(open(FILE,$archivo))
{print "\n\n No se pudo abrir el archivo\n\n";
exit;}

my @arreglo= <FILE>;
close FILE;
my $dna= join('',@arreglo);
$dna =~ s/\s//g;
my @arreglo2 = split('',$dna);

my $contadorA=0;
my $contadorT=0;
my $contadorG=0;
my $contadorC=0;
my $otros=0;

foreach my $base (@arreglo2){
if($base eq 'A'){++$contadorA;}
elsif($base eq 'T'){++$contadorT;}
elsif($base eq 'G'){++$contadorG;}
elsif($base eq 'C'){++$contadorC;}
else{++$otros;}
}

my $longitud = length($dna);

print "Esta es la longitud de la secuencia\n\n";
print "$longitud bp\n\n";

print "Estas son las cantidades de cada nucleotido\n\n";
print "A= $contadorA\n\n";
print "T= $contadorT\n\n";
print "G= $contadorG\n\n";
print "C= $contadorC\n\n";
print "otros= $otros\n\n";

my $total = $contadorA+$contadorT+$contadorG+$contadorC+$otros;
my $pA= ($contadorA/$total)*100;
my $pG= ($contadorG/$total)*100;
my $pC= ($contadorC/$total)*100;
my $pT= ($contadorT/$total)*100;
my $po= ($otros/$total)*100;
my $pGC= ($pC+$pG);

print "Estos son los porcentajes\n\n";
print "%A= $pA\n\n";
print "%T= $pT\n\n";
print "%C= $pC\n\n";
print "%G= $pG\n\n";
print "%otros= $po\n\n";
print "%GC= $pGC\n\n";

print "Estos son los codones presentes en la secuencia\n\n";
my %kmers; 
my $k = 3; 

for(my $i = 0; $i <= $longitud - $k; $i = $i + 3) {
    my $kmer = substr($dna, $i, $k); 
    $kmers{$kmer}++; 
}

while(my ($kmer, $count) = each %kmers) {
    print "$kmer = $count\n";
}


exit;