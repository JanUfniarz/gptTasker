package com.example.backend.gpt.tutorial;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table
public class Tutorial {

    @Id
    @SequenceGenerator(
            name = "tutorial_sequence",
            sequenceName = "tutorial_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "tutorial_sequence"
    )
    private Long id;

    private String topic;

    @ElementCollection
    @CollectionTable(
            name = "paragraphs",
            joinColumns = @JoinColumn(
                    name = "tutorial_id"
            )
    )
    @Embedded
    private List<Paragraph> paragraphs;
}
