package com.example.backend.gpt;

import org.apache.commons.exec.CommandLine;
import org.apache.commons.exec.DefaultExecutor;
import org.apache.commons.exec.PumpStreamHandler;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public abstract class TaskerScriptsDirector {

    protected String path;

    protected abstract String create(String topic);

    protected String generate(CommandLine commandLine) {
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

            String result = Files.readString(
                    Paths.get(
                            path + "output.txt"
                    )
            );

            int startIndex = result.indexOf("<@start>");
            result = result.substring(startIndex);
            int endIndex = result.indexOf("<@end>");
            result = result.substring(0, endIndex + 6);

            return result;

        } catch (IOException e) {
            e.printStackTrace();
        }
        return "";
    }
}