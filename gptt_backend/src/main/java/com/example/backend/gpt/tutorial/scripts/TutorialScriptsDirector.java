package com.example.backend.gpt.tutorial.scripts;

import com.example.backend.gpt.TaskerScriptsDirector;
import org.apache.commons.exec.CommandLine;
import org.springframework.stereotype.Component;

@Component
public class TutorialScriptsDirector extends TaskerScriptsDirector {

    public TutorialScriptsDirector() {
        super.path = "C:\\Users\\januf\\Desktop\\IDEA\\fullstack\\backend" +
                "\\src\\main\\java\\com\\example\\backend\\gpt\\tutorial\\scripts\\";
    }

    @Override
    public String create(String topic) {

        CommandLine commandLine = new CommandLine("powershell.exe");
        commandLine.addArgument("-ExecutionPolicy");
        commandLine.addArgument("Bypass");
        commandLine.addArgument("-File");
        commandLine.addArgument(path + "tutorialGenerator.ps1");
        commandLine.addArgument(topic);
        commandLine.addArgument("-Encoding");
        commandLine.addArgument("UTF8");

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
        commandLine.addArgument("-Encoding");
        commandLine.addArgument("UTF8");

        return generate(commandLine);
    }
}