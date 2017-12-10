public final class Utils {


    /**
     * get the name from scenario tag
     */
    public static String retrieveName(String scenario)     {
        String name = scenario.replace("<SCENARIO ", "");
        return name.replace(">", "");
    }
}