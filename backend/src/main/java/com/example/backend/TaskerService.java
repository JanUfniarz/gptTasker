package com.example.backend;

import java.util.List;

public abstract class TaskerService {

    public abstract void processTaskCreation(String topic);

    public abstract void deleteTask(Long id);

    public abstract List<Object> getTaskList();

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
