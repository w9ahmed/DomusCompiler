public class Appareil {

    private String name;
    private String ident;
    private String classType;

    public Appareil(Object appareil, Object ident) {
        this.name = (String)appareil;
        this.ident = (String)ident;

        if(this.name.equals("volet") || this.name.equals("fenetre")) {
            this.classType = "CVoletFenetre";
        } else {
            this.classType = "C" + this.name.substring(0, 1).toUpperCase() + this.name.substring(1);
        }
    }

    public String getName() {
        return this.name;
    }

    public String getIdent() {
        return this.ident;
    }

    public String getClassType() {
        return this.classType;
    }

    public String toString() {
        return this.classType + " " + this.ident + " = new " + this.classType + "(\"" + this.ident + "\", TypeAppareil." + this.getName().toUpperCase() + ");" + "\nma_liste_appareils.add(" + this.ident + ");";
    }
}