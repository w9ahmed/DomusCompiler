public class Scenario {

    String name;

    public Scenario(String name) {
        this.name = Utils.retrieveName(name);
        System.out.println(this.name);
    }

    public String getName() {
        return this.name;
    }

    public String toString() {
        return " ";
    }
}