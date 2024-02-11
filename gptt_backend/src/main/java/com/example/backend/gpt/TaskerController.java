package com.example.backend.gpt;

import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public abstract class TaskerController {

    public TaskerService service;

    @PostMapping
    public void createTask(
            @RequestParam String topic
    ) {
        service.processTaskCreation(topic);
    }

    @DeleteMapping(path = "{Id}")
    public void deleteTutorial(
            @PathVariable("Id") Long id
    ) {
        service.deleteTask(id);
    }

    @GetMapping
    @ResponseBody
    public List<Object> getTasks() {
        return service.getTaskList();
    }
}