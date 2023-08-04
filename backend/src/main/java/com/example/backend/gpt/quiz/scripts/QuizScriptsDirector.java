package com.example.backend.gpt.quiz.scripts;

import com.example.backend.gpt.TaskerScriptsDirector;
import org.apache.commons.exec.CommandLine;
import org.springframework.stereotype.Component;

@Component
public class QuizScriptsDirector extends TaskerScriptsDirector {

    public QuizScriptsDirector() {
        super.path = "C:\\Users\\januf\\Desktop\\IDEA\\fullstack\\backend" +
                "\\src\\main\\java\\com\\example\\backend\\gpt\\quiz\\scripts\\";
    }

    @Override
    public String create(String topic) {

        CommandLine commandLine = new CommandLine("powershell.exe");
        commandLine.addArgument("-ExecutionPolicy");
        commandLine.addArgument("Bypass");
        commandLine.addArgument("-File");
        commandLine.addArgument(path + "quizGenerator.ps1");
        commandLine.addArgument(topic);
        commandLine.addArgument("-Encoding");
        commandLine.addArgument("UTF8");

        return generate(commandLine);
    }
}