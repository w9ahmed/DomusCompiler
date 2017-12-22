public class Interface {

    private String name;
    private String ident;
    private String interfaceType;

    public Interface(Object appareil, Object ident) {
        this.name = (String)appareil;
        this.ident = (String)ident;

        this.interfaceType = "CInterface";
    }

    public String getName() {
        return this.name;
    }

    public String getIdent() {
        return this.ident;
    }

    public String getInterfaceType() {
        return this.interfaceType;
    }

    public String toString() {
        return this.interfaceType + " " + this.ident + " = new " + this.interfaceType + "(\"" + this.ident + "\", TypeInterface." + this.getName().toUpperCase() + ");" + "\nma_liste_interfaces.add(" + this.ident + ");";
    }
}