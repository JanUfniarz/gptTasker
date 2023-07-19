package com.example.backend.gpt.tutorial;

import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
@Embeddable
@NoArgsConstructor
public class Paragraph {

    private String headline;

    private String body;
}
