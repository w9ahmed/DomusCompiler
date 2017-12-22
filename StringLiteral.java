public class StringLiteral {

    private String message;

    public StringLiteral(Object message) {
        this.message = ((String) message).replaceAll("\"", "");
    }

    public String toString() {
        return "System.out.println(\"" + this.message + "\")";
    }
    
}