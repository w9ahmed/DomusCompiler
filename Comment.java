public class Comment {

    private String comment;

    public Comment(String comment) {
        System.out.println(comment);
        this.comment = comment;
    }

    public String getComment() {
        return this.comment;
    }

    public String toString() {
        return this.comment;
    }
    
}