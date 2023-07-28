package com.example.backend.gpt.tutorial;

import com.example.backend.gpt.tutorial.scripts.TutorialScriptsDirectorACE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TutorialService {

    private final TutorialScriptsDirectorACE scriptsDirector;


    private final TutorialRepository repository;

    @Autowired
    public TutorialService(
            TutorialScriptsDirectorACE tutorialScriptsDirector,
            TutorialRepository tutorialRepository
    ) {
        this.scriptsDirector = tutorialScriptsDirector;
        this.repository = tutorialRepository;
    }

    public void processTutorialCreation(String topic) {
        repository
                .findByTopic(topic)
                .ifPresent(repository::delete);

        repository.save(
                new Tutorial(
                        repairPolishChars(
                                scriptsDirector
                                        .create(topic)
                        )
                )
        );
    }

    public void deleteTutorial(Long id) {
        if (!repository.existsById(id))
            throw new IllegalStateException(
                "tutorial with id " + id + " do not exist"
            );
        repository.deleteById(id);
    }

    public List<Tutorial> getTutorialList() {
        return repository.findAll();
    }

    public void updateTutorial(
            Long id, String primaryColor,
            String paragraphToGenerate, String paragraphToRemove
    ) {
        System.out.println("Metoda updateTutorial - id: " + id);
        System.out.println("Metoda updateTutorial - primaryColor: " + primaryColor);
        System.out.println("Metoda updateTutorial - paragraphToGenerate: " + paragraphToGenerate);
        System.out.println("Metoda updateTutorial - paragraphToRemove: " + paragraphToRemove);

        Tutorial tutorial = repository
                .findById(id)
                .orElseThrow();

        if (primaryColor != null) tutorial.setPrimaryColor(primaryColor);

        if (paragraphToGenerate != null) {
            Paragraph newParagraph = crateParagraph(tutorial, paragraphToGenerate);
            if (
                    tutorial.getParagraphs()
                            .stream()
                            .anyMatch(
                                    paragraph -> paragraph.getHeadline()
                                            .equals(paragraphToGenerate))
            )
                tutorial.replaceParagraphBody(newParagraph);
            else tutorial.addParagraph(newParagraph);
        }

        if (paragraphToRemove != null)
            tutorial.removeParagraph(paragraphToRemove);
    }

    private String repairPolishChars(String sgptResponse) {
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
                .replaceAll("č", "ź");
    }

    private Paragraph crateParagraph(Tutorial tutorial, String headline) {
        return new Paragraph(
                repairPolishChars(
                        scriptsDirector
                                .create(
                                        tutorial.getTopic(),
                                        headline
                                )
                )
        );
    }
}