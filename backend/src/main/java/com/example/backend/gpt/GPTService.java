package com.example.backend.gpt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GPTService {

    private final ScriptsDirector scriptsDirector;

    @Autowired
    public GPTService(ScriptsDirector scriptsDirector) {
        this.scriptsDirector = scriptsDirector;
    }

    public void processTutorialCreation(String topic) {
        scriptsDirector.tutorialMaker(topic);
    }
}