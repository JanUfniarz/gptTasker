package com.example.backend.gpt.tutorial;

import com.example.backend.gpt.PrimaryColor;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.Objects;

@Entity
@Table
@NoArgsConstructor
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

    @Getter
    @Setter
    private PrimaryColor primaryColor;

    @Getter
    private String topic;

    @SuppressWarnings("FieldMayBeFinal")
    @ElementCollection
    @CollectionTable(
            name = "paragraphs",
            joinColumns = @JoinColumn(
                    name = "tutorial_id"
            )
    )
    @Embedded
    private List<Paragraph> paragraphs;

    public Tutorial(String topic, List<Paragraph> paragraphs) {
        this.topic = topic;
        this.paragraphs = paragraphs;
        this.primaryColor = PrimaryColor.GRAY;
    }

    public List<Paragraph> getParagraphs() {
        return List.copyOf(paragraphs);
    }

    public void replaceParagraphBody(Paragraph newParagraph) {
        paragraphs.forEach(paragraph -> {
            if (Objects.equals(
                    paragraph.getHeadline(), newParagraph.getHeadline()
            )) paragraph.setBody(
                    newParagraph.getBody()
            );
        });
    }

    public void removeParagraph(Paragraph paragraph) {
        int index = -1;
        for (int i = 0; i < paragraphs.size(); i++) {
            if (paragraphs.get(i).equals(paragraph)) {
                index = i;
                break;
            }
        }

        if (index != -1) paragraphs.remove(index);
    }
}
