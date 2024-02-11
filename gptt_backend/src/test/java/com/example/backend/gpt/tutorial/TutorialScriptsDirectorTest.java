//package com.example.backend.gpt.tutorial;
//
//import com.example.backend.gpt.quiz.scripts.QuizScriptsDirector;
//import com.example.backend.gpt.tutorial.scripts.TutorialScriptsDirector;
//import org.junit.jupiter.api.Test;
//
//import static org.junit.jupiter.api.Assertions.assertTrue;
//
//class TutorialScriptsDirectorTest {
//
//    @Test
//    public void generateTutorial() {
//
//
//
//        //* TutorialScriptsDirector scriptsDirector = new TutorialScriptsDirector();
//        QuizScriptsDirector scriptsDirector = new QuizScriptsDirector();
//
//        String result = scriptsDirector.create("gitary");
//
//        System.out.println(result);
//
//        assertTrue(
//                result.contains("<@topic>") &&
//                        result.contains("<@head>") &&
//                        result.contains("<@paragraph>"),
//                "result do not contain markers"
//        );
//        assertTrue(
//                result.startsWith("<@start>"),
//                "result do not starts properly"
//        );
//        assertTrue(
//                result.endsWith("<@end>"),
//                "result do not ends properly"
//        );
//    }
//
//}