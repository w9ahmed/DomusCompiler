// Programme simple sans erreur
// declaration des appareils
CEclairage e1 = new CEclairage("e1", TypeAppareil.ECLAIRAGE);
ma_liste_appareils.add(e1);
CVolet v1 = new CVolet("v1", TypeAppareil.VOLET);
ma_liste_appareils.add(v1);
CAutreAppareil hf = new CAutreAppareil("hf", TypeAppareil.AUTRE_APPAREIL_HIFI);
ma_liste_appareils.add(hf);
CAutreAppareil cafe = new CAutreAppareil("cafe", TypeAppareil.AUTRE_APPAREIL_CAFE);
ma_liste_appareils.add(cafe);
CVolet v2 = new CVolet("v2", TypeAppareil.VOLET);
ma_liste_appareils.add(v2);
// declaration d'un ensemble d'appareils (type enumere utilisateur)
CEnsAppareil mon_eclairage_salon = new CAutreAppareil("mon_eclairage_salon");
mon_eclairage_salon.add(e1);
ma_liste_ens_appareils.add(mon_eclairage_salon);
// déclaration des interfaces
CInterface b1 = new CInterface("b1", TypeInterface.INTERRUPTEUR);
ma_liste_interfaces.add(b1);
CInterface t1 = new CInterface("t1", TypeInterface.MOBILE);
ma_liste_interfaces.add(t1);
CInterface zap = new CInterface("zap", TypeInterface.TELECOMMANDE);
ma_liste_interfaces.add(zap);
CInterface b4 = new CInterface("b4", TypeInterface.INTERRUPTEUR);
ma_liste_interfaces.add(b4);
// declaration des scenarii
// declaration du scenario bonjour
// declaration des commandes
// le scenario soiree est lance tous les soirs du premier jour de chaque mois 2017 a 18h.
