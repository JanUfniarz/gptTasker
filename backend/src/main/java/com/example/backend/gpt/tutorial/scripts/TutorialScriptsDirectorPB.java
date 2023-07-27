package com.example.backend.gpt.tutorial.scripts;

import org.springframework.stereotype.Component;

import java.io.*;
import java.util.Map;

@Component
public class TutorialScriptsDirectorPB {

    private final String path = "C:\\Users\\januf\\Desktop\\IDEA\\fullstack\\backend" +
            "\\src\\main\\java\\com\\example\\backend\\gpt\\tutorial\\scripts\\";

    public String create(String topic) {
        return generate(new String[]{
                //"$env:PATH += \";C:\\Users\\januf\\AppData\\Roaming\\Python\\Python311\\Scripts\\\"",
                "powershell.exe",
                "-ExecutionPolicy",
                "Bypass",
                "-File",
                path + "test.ps1",
//                path + "tutorialGenerator.ps1",
                topic
        });
    }

    public String create(String topic, String headline) {
        return generate(new String[]{
                //"$env:PATH += \";C:\\Users\\januf\\AppData\\Roaming\\Python\\Python311\\Scripts\\sgpt.exe\"",
                "powershell.exe",
                "-ExecutionPolicy",
                "Bypass",
                "-File",
                path + "paragraphGenerator.ps1",
                topic,
                headline
        });
//        return generate("& " + path
//                + "paragraphGenerator.ps1 "
//                + topic + " " + headline
//        );
    }

    private String generate(String[] command) {
        try {
            ProcessBuilder pb = new ProcessBuilder(
                    command
            );

            Map<String, String> environment = pb.environment();
            System.out.println(environment);

            Process process = pb.start();

            int exitCode = process.waitFor();

            if (exitCode == 0) return readOutputFromTXT();

            else System.err.println("Skrypt PowerShell zwrócił błąd!" +
                    "\nexit code: " + exitCode +
                    "\ntreść: " + readErrorOutput(process.getErrorStream())
            );

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