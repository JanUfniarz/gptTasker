package com.example.backend.gpt.quiz;

import com.example.backend.gpt.Task;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table()
@NoArgsConstructor
public class Quiz extends Task {

    @Id
    @SequenceGenerator(
            name = "quiz_sequence",
            sequenceName = "quiz_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "quiz_sequence"
    )
    @Getter
    private Long id;

    @ElementCollection
    @CollectionTable(
            name = "questions",
            joinColumns = @JoinColumn(
                    name = "quiz_id"
            )
    )
    @Embedded
    private List<Question> questions = new ArrayList<>();

    @SuppressWarnings("unused")
    public Quiz(String topic, List<Question> questions) {
        this.topic = topic;
        this.questions = questions;
        this.primaryColor = "gray";
    }

    public Quiz(String formatted) {
        //TODO IMPLEMENT
    }

    public List<Question> getQuestions() {
        return List.copyOf(questions);
    }

    public void removeQuestion(String content) {
        int index = -1;
        for (int i = 0; i < questions.size(); i++) {
            if (questions.get(i).getContent().equals(content)) {
                index = i;
                break;
            }
        }

        if (index != -1) questions.remove(index);
    }

    public void addQuestion(Question question) {
        questions.add(question);
    }
}