package com.example.backend;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public abstract class TaskerService {

    public JpaRepository<?, Long> repository;

    public abstract void processTaskCreation(String topic);

    public void deleteTask(Long id) {
        if (!repository.existsById(id))
            throw new IllegalStateException(
                    "task with id " + id + " do not exist"
            );
        repository.deleteById(id);
    }

    @SuppressWarnings("unchecked")
    public List<Object> getTaskList() {
        return (List<Object>) repository.findAll();
    }

    public String repairPolishChars(String sgptResponse) {
        return  sgptResponse
                .replaceAll("╣", "ą")
                .replaceAll("│", "ł")
                .replaceAll("ť", "ś")
                .replaceAll("ˇ", "ó")
                .replaceAll("┐", "ż")
                .replaceAll("Ä™", "ę")
                .replaceAll("ŕ", "ę")
                .replaceAll("Š", "ć")
                .replaceAll("˝", "ń")
                .replaceAll("č", "ź")
                .replaceAll("Ă", "Ć");
    }
}