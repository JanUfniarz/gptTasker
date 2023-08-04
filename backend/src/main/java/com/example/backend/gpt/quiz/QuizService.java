package com.example.backend.gpt.quiz;

import com.example.backend.TaskerService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuizService extends TaskerService {

    @Override
    public void processTaskCreation(String topic) {

    }

    @Override
    public void deleteTask(Long id) {

    }

    @Override
    public List<Object> getTaskList() {
        return null;
    }
}
