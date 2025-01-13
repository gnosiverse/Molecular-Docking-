#!/usr/bin/perl
use strict;
use warnings;

# Define receptor and ligands
my $receptor = "receptor.pdbqt";  # Path to your receptor file
my @ligands = ("ligand1.pdbqt", "ligand2.pdbqt", "ligand3.pdbqt", "ligand4.pdbqt", # Add all 30 ligands here
               "ligand5.pdbqt", "ligand6.pdbqt", "ligand7.pdbqt", "ligand8.pdbqt", 
               "ligand9.pdbqt", "ligand10.pdbqt", "ligand11.pdbqt", "ligand12.pdbqt", 
               "ligand13.pdbqt", "ligand14.pdbqt", "ligand15.pdbqt", "ligand16.pdbqt", 
               "ligand17.pdbqt", "ligand18.pdbqt", "ligand19.pdbqt", "ligand20.pdbqt",
               "ligand21.pdbqt", "ligand22.pdbqt", "ligand23.pdbqt", "ligand24.pdbqt",
               "ligand25.pdbqt", "ligand26.pdbqt", "ligand27.pdbqt", "ligand28.pdbqt", 
               "ligand29.pdbqt", "ligand30.pdbqt");  # Add up to 30 ligands or more

# Loop over ligands and run docking for each
foreach my $ligand (@ligands) {
    my $output = "output_" . $ligand;  # Unique output for each ligand
    my $logfile = $ligand . ".log";    # Log file for each ligand
    my $command = "vina --receptor $receptor --ligand $ligand --out $output --log $logfile";

    # Run docking
    system($command) == 0 or die "Failed to run Vina for $ligand: $!\n";
    print "Docking for $ligand completed. Results saved to $output\n";
}
