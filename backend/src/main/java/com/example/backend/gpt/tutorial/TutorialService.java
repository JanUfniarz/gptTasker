package com.example.backend.gpt.tutorial;

import com.example.backend.gpt.ScriptsDirector;
import com.profesorfalken.jpowershell.PowerShell;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TutorialService {

    private final ScriptsDirector scriptsDirector;

    @Autowired
    public TutorialService(ScriptsDirector scriptsDirector) {
        this.scriptsDirector = scriptsDirector;
    }

    public void processTutorialCreation(String topic) {
        String rawResponse = scriptsDirector.tutorialMaker(topic);

    }

    public void removeFromResults(String topic) {
        PowerShell.executeSingleCommand(
                "Remove-Item -Path ./results/" + topic + ".txt"
        );
    }
}