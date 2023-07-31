package com.example.backend.gpt.tutorial;

import com.example.backend.gpt.tutorial.scripts.TutorialScriptsDirectorACE;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

class TutorialScriptsDirectorTest {

    @Test
    public void generateTutorial() {

        //* TutorialScriptsDirectorPB scriptsDirector = new TutorialScriptsDirectorPB();
        //* TutorialScriptsDirectorJPS scriptsDirector = new TutorialScriptsDirectorJPS();
        TutorialScriptsDirectorACE scriptsDirector = new TutorialScriptsDirectorACE();

        String result = scriptsDirector.create("gitary");

        assertTrue(
                result.contains("<@topic>") &&
                        result.contains("<@head>") &&
                        result.contains("<@paragraph>"),
                "result do not contain markers"
        );
        assertTrue(
                result.startsWith("<@start>"),
                "result do not starts properly"
        );
        assertTrue(
                result.endsWith("<@end>"),
                "result do not ends properly"
        );
    }

}