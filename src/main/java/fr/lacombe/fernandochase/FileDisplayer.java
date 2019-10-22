package fr.lacombe.fernandochase;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

public class FileDisplayer {
    public String getFileContent(Path textFilePath) {
        String fileContent = "";

        try {
            fileContent = Files.readString(textFilePath);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return fileContent;
    }
}
