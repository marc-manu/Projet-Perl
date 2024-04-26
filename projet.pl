use strict;
use warnings;

my $adresse_ip;
my $horodotage;
my $code;
my $autre_code;
my $occ_erreur = 0;
my $occ_reussite = 0;
my $occ_autre_erreur=0;
open(my $fh, '<', 'C:\\Users\\maest\\Documents\\nouveau dossier\\Mes docs\\Cours L3\\Perl\\Projet_Perl\\logapache.txt') or die "Erreur lors de l'ouverture du fichier : $!";



print  "                              JOURNAL D\'UN FICHIER LOG APACHE \n \n \n";

while (my $ligne = <$fh>) {
    if ($ligne =~ m/(\d+\.\d+\.\d+\.\d+)/) {
        $adresse_ip = $1;
      
    }

    if ($ligne =~ m/\[(\d{2}\/\w+\/\d{4}:\d{2}:\d{2}:\d{2}\s+\+\d{4})\]/) {
        $horodotage = $1;
          
    
    }
   if ($ligne=~m/HTTP\/\d\.\d" (\d{3})/) {
         $autre_code = $1;

        
   }if ($autre_code == 200) {
           $occ_reussite +=1;
       } elsif ($autre_code == 404) {
           $occ_erreur +=1 ;
       } elsif ($autre_code != 200 && $code != 404) {
          $occ_autre_erreur +=1;
   }



   if ($ligne =~ m/(\d{3})\s+/) {
       $code = $1;
      
      

   }

   if ($adresse_ip && $horodotage && $code) {
        print  "                 Adresse_ip :  $adresse_ip,  Horodotage :  $horodotage,  Code_reponse :  $code\n";
    
}
}
 
 print  " \n le nombre de requete reussie est : $occ_reussite \n";
 print " \n le nombre de requete echouees 404 : $occ_erreur \n";
 print  "\n le nombre de requete echouees avec des messages specifique : $occ_autre_erreur ";
close($fh)