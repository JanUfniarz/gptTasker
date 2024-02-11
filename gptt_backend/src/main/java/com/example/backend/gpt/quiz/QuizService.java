package com.example.backend.gpt.quiz;

import com.example.backend.gpt.TaskerService;
import com.example.backend.gpt.quiz.scripts.QuizScriptsDirector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuizService extends TaskerService {

    @Autowired
    public QuizService(
            QuizScriptsDirector quizScriptsDirector,
            QuizRepository quizRepository
    ) {
        super.scriptsDirector = quizScriptsDirector;
        super.repository = quizRepository;
    }

    private QuizRepository qRepository() {
        return (QuizRepository) repository;
    }

    @Override
    public void processTaskCreation(String topic) {
//        qRepository()
//                .findByTopic(topic)
//                .ifPresent(qRepository()::delete);

//TODO        qRepository().save(
//TODO                new Quiz(
//TODO                        repairPolishChars(
//TODO                                scriptsDirector
//TODO                                        .create(topic)
//TODO                        )
//TODO                )
//TODO        );
    }
}
