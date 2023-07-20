package com.example.backend.gpt;

import com.profesorfalken.jpowershell.PowerShell;
import com.profesorfalken.jpowershell.PowerShellResponse;

import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@NoArgsConstructor
@Component
public class ScriptsDirector {

    public String generateTutorial(String topic) {
        PowerShellResponse response = PowerShell.executeSingleCommand(
                "& .\\scripts\\tutorialGenerator.ps1 "
                        + topic
        );
        return lastLine(response);
    }

    public String generateParagraph(String topic, String headline) {
        PowerShellResponse response = PowerShell.executeSingleCommand(
                "& .\\scripts\\paragraphGenerator.ps1 "
                        + topic + " " + headline
        );
        return lastLine(response);
    }

    private String lastLine(PowerShellResponse response) {
        String output = response.getCommandOutput();

        if (response.isError()) throw new RuntimeException(output);

        String[] lines = output.split("\\r?\\n");

        if (lines.length > 0) return lines[lines.length - 1];

        throw new RuntimeException(
                "Script did not gave any output"
        );
    }
}