package com.example.backend.gpt;

import com.profesorfalken.jpowershell.PowerShell;
import com.profesorfalken.jpowershell.PowerShellResponse;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@NoArgsConstructor
@Component
public class ScriptsDirector {

    public void tutorialMaker(String topic) {
        PowerShellResponse response = PowerShell.executeSingleCommand(
                "& .\\scripts\\tutorial.ps1 " + topic
        );
        printOutput(response);
    }

    private void printOutput(PowerShellResponse response) {
        if (response.isError()) System.out.println(
                "Błąd: " + response.getCommandOutput()
        );
        else System.out.println(
                "Wynik: " + response.getCommandOutput()
        );
    }
}