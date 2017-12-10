public final class Utils {


    /**
     * get the name from scenario tag
     */
    public static String retrieveName(String scenario) {
        String name = scenario.replace("<SCENARIO ", "");
        return name.replace(">", "");
    }

    public static String fixDate(String date) {
        return date.replace("_", "-1");
    }
}