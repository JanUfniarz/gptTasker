package com.example.backend.gpt.tutorial;

import jakarta.persistence.Embeddable;
import lombok.*;

@AllArgsConstructor
@Getter
@Setter
@Embeddable
@NoArgsConstructor
public class Paragraph {

    private String headline;

    private String body;

    public Paragraph(String formatted) {
        String[] headCut = formatted.split("<@head>");

        this.headline = headCut[0];
        this.body = headCut[1];
    }
}