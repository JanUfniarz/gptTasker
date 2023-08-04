package com.example.backend.gpt.quiz;

import com.example.backend.TaskerController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "v1/gpt/quiz")
public class QuizController extends TaskerController {

    @SuppressWarnings("unused")
    @Autowired
    public QuizController(QuizService quizService) {
        super.service = quizService;
    }

    // TODO PutMapping

}