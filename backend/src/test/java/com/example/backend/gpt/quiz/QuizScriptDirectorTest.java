package com.example.backend.gpt.quiz;

import com.example.backend.gpt.quiz.scripts.QuizScriptsDirector;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class QuizScriptDirectorTest {
    @Test
    public void generateTutorial() {

        QuizScriptsDirector scriptsDirector = new QuizScriptsDirector();

        String result = scriptsDirector.create("Gitary");
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
