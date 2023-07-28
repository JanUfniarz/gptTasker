package com.example.backend.gpt.tutorial;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Table()
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
    @Getter
    private Long id;

    @Getter
    @Setter
    private String primaryColor;

    @Getter
    @Setter
    private String topic;

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
        this.primaryColor = "Gray";
    }

    public Tutorial(String formatted) {

        System.out.println(
                "formatted: " + formatted
        );

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
            System.out.println(
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
        for (int i = 0; i < paragraphs.size(); i++) {
            if (paragraphs.get(i).getHeadline().equals(headline)) {
                index = i;
                break;
            }
        }

        if (index != -1) paragraphs.remove(index);
    }

    public void addParagraph(Paragraph paragraph) {
        paragraphs.add(paragraph);
    }
}