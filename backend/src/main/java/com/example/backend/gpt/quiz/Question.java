package com.example.backend.gpt.quiz;

import jakarta.persistence.Embeddable;
import lombok.*;

@AllArgsConstructor
@Getter
@Setter
@Embeddable
@NoArgsConstructor
public class Question {

    private String content;

    private String answer;

    public Question(String formatted) {
        // TODO IMPLEMENT
    }
}
