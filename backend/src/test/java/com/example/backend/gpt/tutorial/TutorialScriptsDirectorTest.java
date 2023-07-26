package com.example.backend.gpt.tutorial;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class TutorialScriptsDirectorTest {

    @Test
    public void generateTutorial() {

        TutorialScriptsDirectorPB scriptsDirector = new TutorialScriptsDirectorPB();

        String result = scriptsDirector.generateTutorial("gitary");

        assertTrue(
                result.contains("<@topic>") &&
                        result.contains("<@head>") &&
                        result.contains("<@paragraph>"),
                "result do not contain markers"
        );

    }

}