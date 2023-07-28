package com.example.backend.gpt.tutorial.scripts;

import org.apache.commons.exec.CommandLine;
import org.apache.commons.exec.DefaultExecutor;
import org.apache.commons.exec.PumpStreamHandler;
import org.springframework.stereotype.Component;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

@Component
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

            String result = outputStream.toString();
            int startIndex = result.indexOf("<@start>");
            result = result.substring(startIndex);
            int endIndex = result.indexOf("<@end>");
            result = result.substring(0, endIndex + 6);

            System.out.println(result);
            return result;

        } catch (IOException e) {
            e.printStackTrace();
        }
        return "";
    }
}