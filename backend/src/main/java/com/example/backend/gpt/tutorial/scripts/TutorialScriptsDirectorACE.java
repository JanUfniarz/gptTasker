package com.example.backend.gpt.tutorial.scripts;

import org.apache.commons.exec.*;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.FileReader;
import java.io.IOException;

public class TutorialScriptsDirectorACE {

    private final String path = "C:\\Users\\januf\\Desktop\\IDEA\\fullstack\\backend" +
            "\\src\\main\\java\\com\\example\\backend\\gpt\\tutorial\\scripts\\";

    public String create(String topic) {

        CommandLine commandLine = new CommandLine("powershell.exe");
        commandLine.addArgument("-ExecutionPolicy");
        commandLine.addArgument("Bypass");
        commandLine.addArgument("-File");
        commandLine.addArgument(path + "tutorialGenerator.ps1");
        commandLine.addArgument(topic);

        return generate(commandLine);
    }

    public String create(String topic, String headline) {

        CommandLine commandLine = new CommandLine("powershell.exe");
        commandLine.addArgument("-ExecutionPolicy");
        commandLine.addArgument("Bypass");
        commandLine.addArgument("-File");
        commandLine.addArgument(path + "paragraphGenerator.ps1");
        commandLine.addArgument(topic);
        commandLine.addArgument(headline);

        return generate(commandLine);
    }

    private String generate(CommandLine commandLine) {
        try {
            DefaultExecutor executor = new DefaultExecutor();

            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            ByteArrayOutputStream errorStream = new ByteArrayOutputStream();
            PumpStreamHandler streamHandler = new PumpStreamHandler(
                    outputStream,
                    errorStream
            );
            executor.setStreamHandler(streamHandler);


            int exitCode = executor.execute(commandLine);

            System.out.println("==================\n" +
                    "Proces zakończony z kodem: " + exitCode);

            System.out.println("outputStream: " + outputStream.toString());
            return outputStream.toString();

        } catch (IOException e) {
            e.printStackTrace();
        }
        return "";
    }
}
