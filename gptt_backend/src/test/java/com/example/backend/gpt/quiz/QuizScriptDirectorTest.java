//package com.example.backend.gpt.quiz;
//
//import com.example.backend.gpt.quiz.scripts.QuizScriptsDirector;
//import org.junit.jupiter.api.Test;
//
//import static org.junit.jupiter.api.Assertions.assertTrue;
//
//public class QuizScriptDirectorTest {
//    @Test
//    public void generateQuiz() {
//
//        QuizScriptsDirector scriptsDirector = new QuizScriptsDirector();
//
//        String result = scriptsDirector.create("klocki lego");
//
//        System.out.println(result.replaceAll(">", ">\n"));
//
//        assertTrue(
//                result.contains("<@topic>") &&
//                        result.contains("<@content>") &&
//                        result.contains("<@ra>") &&
//                        result.contains("<@wa>") &&
//                        result.contains("<@question>"),
//                        "result do not contain markers"
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
//}