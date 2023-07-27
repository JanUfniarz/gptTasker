package com.example.backend.gpt.tutorial.scripts;

import org.springframework.stereotype.Component;

import java.io.*;

@Component
public class TutorialScriptsDirectorPB {

    private final String path = "C:\\Users\\januf\\Desktop\\IDEA\\fullstack\\backend" +
            "\\src\\main\\java\\com\\example\\backend\\gpt\\tutorial\\scripts\\";

    public String generateTutorial(String topic) {
        try {
            Process process = new ProcessBuilder(
                    "powershell.exe",
                    "& " + path + "tutorialGenerator.ps1 " + topic
            ).start();

            int exitCode = process.waitFor();

            if (exitCode == 0) {
                return readOutputFromTXT();
            } else System.err.println("Skrypt PowerShell zwrócił błąd!" +
                    "\nexit code: " + exitCode +
                    "\ntreść: " + readErrorOutput(process.getErrorStream())
            );

        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
        return "";
    }

    public String generateParagraph(String topic, String headline) {
        try {
            Process process = new ProcessBuilder(
                    "powershell.exe",
                    "& " + path + "tutorialGenerator.ps1 "
                            + topic + " " + headline
            ).start();

            int exitCode = process.waitFor();

            if (exitCode == 0) {
                return readOutputFromTXT();
            } else System.err.println("Skrypt PowerShell zwrócił błąd!");

        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
        return "";
    }

    private String readOutputFromTXT() throws IOException {
        BufferedReader bufferedReader = new BufferedReader(
                new FileReader(path + "output.txt")
        );
        StringBuilder stringBuilder = new StringBuilder();
        String line;

        while ((line = bufferedReader.readLine()) != null)
            stringBuilder.append(line).append("\n");

        bufferedReader.close();
        return stringBuilder.toString();
    }
    private String readErrorOutput(InputStream errorStream) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(
                new InputStreamReader(errorStream)
        );
        StringBuilder stringBuilder = new StringBuilder();
        String line;

        while ((line = bufferedReader.readLine()) != null)
            stringBuilder.append(line).append("\n");

        bufferedReader.close();
        return stringBuilder.toString();
    }
}