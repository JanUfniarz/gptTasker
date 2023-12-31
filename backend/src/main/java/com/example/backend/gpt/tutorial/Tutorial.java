package com.example.backend.gpt.tutorial;

import com.example.backend.gpt.Task;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Table()
@NoArgsConstructor
public class Tutorial extends Task {

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
    @Getter
    private Long id;

    @ElementCollection
    @CollectionTable(
            name = "paragraphs",
            joinColumns = @JoinColumn(
                    name = "tutorial_id"
            )
    )
    @Embedded
    private List<Paragraph> paragraphs = new ArrayList<>();

    @SuppressWarnings("unused")
    public Tutorial(String topic, List<Paragraph> paragraphs) {
        this.topic = topic;
        this.paragraphs = paragraphs;
        this.primaryColor = "gray";
    }

    public Tutorial(String formatted) {

        this.primaryColor = "gray";
        formatted = formatted
                .replaceAll("<@start>", "")
                .replaceAll("<@end>", "");

        String[] topicCut = formatted.split("<@topic>");
        this.topic = topicCut[0];

        try {
            String[] paragraphsCut = topicCut[1].split("<@paragraph>");
            for (String paragraph : paragraphsCut)
                paragraphs.add(
                        new Paragraph(paragraph)
                );
        } catch (ArrayIndexOutOfBoundsException e) {
            System.err.println(
                    "Brak treści tutorialu: <<<<< "
                            + formatted + " >>>>> \n\n " + e
            );
        }
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

    public void removeParagraph(String headline) {
        int index = -1;
        for (int it = 0; it < paragraphs.size(); it++)
            if (paragraphs
                    .get(it)
                    .getHeadline()
                    .equals(headline)) {
                index = it;
                break;
            }
        if (index != -1) paragraphs.remove(index);
    }

    public void addParagraph(Paragraph paragraph) {
        paragraphs.add(paragraph);
    }
}