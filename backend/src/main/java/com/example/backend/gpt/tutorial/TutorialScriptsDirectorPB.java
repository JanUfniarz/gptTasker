package com.example.backend.gpt.tutorial;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class TutorialScriptsDirectorPB {

    private final String path = "C:\\Users\\januf\\Desktop\\IDEA\\fullstack\\backend" +
            "\\src\\main\\java\\com\\example\\backend\\gpt\\tutorial\\";

    public String generateTutorial(String topic) {
        try {
            Process process = new ProcessBuilder(
                    "powershell.exe",
                    "& " + path + "tutorialGenerator.ps1 " + topic
            ).start();

            int exitCode = process.waitFor();

            if (exitCode == 0) {
                BufferedReader bufferedReader = new BufferedReader(
                        new FileReader(path + "output.txt")
                );
                StringBuilder stringBuilder = new StringBuilder();
                String line;

                while ((line = bufferedReader.readLine()) != null)
                    stringBuilder.append(line).append("\n");

                bufferedReader.close();
                return stringBuilder.toString();
            } else System.err.println("Skrypt PowerShell zwrócił błąd!");

        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
        return "";
    }
}