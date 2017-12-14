public class DomusProgram {

    public static final String MAISON_USER = "CMaisonUser.java";
    public static final String HABITAT_SPECIFIC = "HabitatSpecific.java";

    private Writer writer1;
	private Writer writer2;

    public DomusProgram() {
        try {
            this.writer1 = new Writer(MAISON_USER);
            this.writer1.createFile();
        } catch(Exception e) {
            System.out.println("Failed to create " + MAISON_USER);
        }
    }

    public void createScenarii() {
        this.writer2 = new Writer(HABITAT_SPECIFIC);
        try {
            this.writer2.createFile();

            this.writer2.appendln(
            "System.out.println(\"Execution du scenario \""
            + " + this.l_scenarios.get(num).getNomScenario() + \"... \");"
            );

            this.writer2.appendln(
            "switch(num) {"
            );
        } catch(Exception e) {
            System.out.println("Failed to create " + HABITAT_SPECIFIC);
        };
    }

    public void writerMaison(String code) {
        try {
            this.writer1.append(code); 
        } catch(Exception e) {
            System.out.println("Failed to write to " + MAISON_USER);
        }
    }

    public void writerMaisonln(String code) {
        try {
            this.writer1.appendln(code); 
        } catch(Exception e) {
            System.out.println("Failed to write to " + MAISON_USER);
        }
    }

    public void writerHabitat(String code) {
        try {
            this.writer2.append(code); 
        } catch(Exception e) {
            System.out.println("Failed to write to " + HABITAT_SPECIFIC);
        }
    }

    public void writerHabitatln(String code) {
        try {
            this.writer2.appendln(code); 
        } catch(Exception e) {
            System.out.println("Failed to write to " + HABITAT_SPECIFIC);
        }
    }

    public Writer getMaison() {
        return writer1;
    }

    public Writer getHabitat() {
        return writer2;
    }
}