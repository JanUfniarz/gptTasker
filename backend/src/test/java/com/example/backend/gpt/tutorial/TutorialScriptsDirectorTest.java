package com.example.backend.gpt.tutorial;

import com.example.backend.gpt.tutorial.scripts.TutorialScriptsDirector;
import com.example.backend.gpt.tutorial.scripts.TutorialScriptsDirectorPB;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class TutorialScriptsDirectorTest {

    @Test
    public void generateTutorial() {

        //* TutorialScriptsDirectorPB scriptsDirector = new TutorialScriptsDirectorPB();
        TutorialScriptsDirector scriptsDirector = new TutorialScriptsDirector();

        String result = scriptsDirector.generateTutorial("gitary");

        assertTrue(
                result.contains("<@topic>") &&
                        result.contains("<@head>") &&
                        result.contains("<@paragraph>"),
                "result do not contain markers"
        );

    }

}