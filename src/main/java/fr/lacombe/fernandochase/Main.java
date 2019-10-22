package fr.lacombe.fernandochase;

import java.nio.file.Path;
import java.nio.file.Paths;

public class Main {
    public static void main(String[] args) {
        Path textFilePath = Paths.get(args[0]);

        String fileContent = new FileDisplayer().getFileContent(textFilePath);

        System.out.print(fileContent);
    }
}
