import java.io.*;

public class Writer {

    private String fileName;

    public Writer(String fileName) {
        this.fileName = fileName;
    }

    public void createFile() throws IOException {
        BufferedWriter writer = new BufferedWriter(new FileWriter(this.fileName));
        writer.write("");
        writer.close();
    }

    public void append(String text) throws IOException {
        BufferedWriter writer = new BufferedWriter(new FileWriter(this.fileName, true));
        writer.append(text);
        writer.close();
    }

    public void appendln(String text) throws IOException {
        BufferedWriter writer = new BufferedWriter(new FileWriter(this.fileName, true));
        writer.append(text);
        writer.append("\n");
        writer.close();
    }
}