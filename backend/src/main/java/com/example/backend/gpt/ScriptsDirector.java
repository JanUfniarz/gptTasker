package com.example.backend.gpt;

import com.profesorfalken.jpowershell.PowerShell;
import com.profesorfalken.jpowershell.PowerShellResponse;

import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@NoArgsConstructor
@Component
public class ScriptsDirector {

    public String tutorialMaker(String topic) {
        PowerShellResponse response = PowerShell.executeSingleCommand(
                "& .\\scripts\\tutorial.ps1 " + topic
        );

        String output = response.getCommandOutput();

        if (response.isError()) throw new RuntimeException(output);
        else return output;
    }
}