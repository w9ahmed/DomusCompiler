public class Appareil {

    String name;
    String classType;

    public Appareil(Object appareil) {
        this.name = (String)appareil;

        if(this.name.equals("volet") || this.name.equals("fenetre")) {
            this.classType = "CVoletFenetre";
        } else {
            this.classType = "C" + this.name.substring(0, 1).toUpperCase() + this.name.substring(1);
        }
    }

    public String getName() {
        return this.name;
    }

    public String getClassType() {
        return this.classType;
    }

    public String generateCodeForIdent(String ident) {
        return this.getClassType() + " " + ident + " = new " + this.getClassType() + "(\"" + ident + "\", TypeAppareil." + this.getName().toUpperCase() + ");" + "\nma_liste_appareils.add(" + ident + ");";
    }

    public String toString() {
        return " ";
    }
}