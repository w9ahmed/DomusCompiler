public class Token {
    
    private String name;
    private String value;
    private String type;

    public Token(String name) {
        this.name = name;
    }

    public Token(String name, String value) {
        this.name = name;
        this.value = value;
    }

    public Token(String name, String value, String type) {
        this.name = name;
        this.value = value;
        this.type = type;
    }

    public String getName() {
        return this.name;
    }

    public String getValue() {
        return this.value;
    }
}