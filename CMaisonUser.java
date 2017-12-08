// Commentaire : declaration des appareils
CEclairage e1 = new CEclairage("e1", TypeAppareil.ECLAIRAGE);
ma_liste_appareils.add(e1);
CVolet v1 = new CVolet("v1", TypeAppareil.VOLET);
ma_liste_appareils.add(v1);
CChauffage rad1 = new CChauffage("rad1", TypeAppareil.CHAUFFAGE);
ma_liste_appareils.add(rad1);
CAlarme a1 = new CAlarme("a1", TypeAppareil.ALARME);
ma_liste_appareils.add(a1);
CFenetre fen = new CFenetre("fen", TypeAppareil.FENETRE);
ma_liste_appareils.add(fen);
CAutreAppareil cafe = new CAutreAppareil("cafe", TypeAppareil.AUTRE_APPAREIL_CAFE);
ma_liste_appareils.add(cafe);
CAutreAppareil hf = new CAutreAppareil("hf", TypeAppareil.AUTRE_APPAREIL_HIFI);
ma_liste_appareils.add(hf);
// déclaration d'un ensemble d'appareils (type énumeré utilisateur)
CEnsAppareil mon_eclairage_salon = new CAutreAppareil("mon_eclairage_salon");
mon_eclairage_salon.add(e2);
ma_liste_ens_appareils.add(mon_eclairage_salon);
// déclaration des interfaces
CInterface b1 = new CInterface("b1", TypeInterface.INTERRUPTEUR);
ma_liste_interfaces.add(b1);
CInterface t1 = new CInterface("t1", TypeInterface.MOBILE);
ma_liste_interfaces.add(t1);
CInterface c1 = new CInterface("c1", TypeInterface.TELECOMMANDE);
ma_liste_interfaces.add(c1);
// déclaration des scenarii
// déclaration du scenario bonjour
// déclaration du scenario soiree
// déclaration du scenario soiree musique
// déclaration du scenario depart
