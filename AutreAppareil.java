public class AutreAppareil {

    private String name;
    private String ident;
    private String classType;

    public AutreAppareil(Object appareil, Object ident) {
        this.name = (String)appareil;
        this.ident = (String)ident;

        this.classType = "CAutreAppareil";
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
        return this.classType + " " + this.ident + " = new " + this.classType + "(\"" + this.ident + "\", TypeAppareil.AUTRE_APPAREIL_" + this.getName().toUpperCase() + ");" + "\nma_liste_appareils.add(" + this.ident + ");";
    }
}