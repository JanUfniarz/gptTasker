package com.example.backend.gpt.tutorial;

import com.example.backend.gpt.ScriptsDirector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TutorialService {

    private final ScriptsDirector scriptsDirector;

    private final TutorialRepository tutorialRepository;

    @Autowired
    public TutorialService(
            ScriptsDirector scriptsDirector,
            TutorialRepository tutorialRepository
    ) {
        this.scriptsDirector = scriptsDirector;
        this.tutorialRepository = tutorialRepository;
    }

    public void processTutorialCreation(String topic) {
        tutorialRepository
                .findByTopic(topic)
                .ifPresent(tutorialRepository::delete);

        tutorialRepository.save(
                new Tutorial(
                        repairPolishChars(
                                scriptsDirector
                                        .generateTutorial(topic)
                        )
                )
        );
    }

    public void deleteTutorial(Long id) {
        if (!tutorialRepository.existsById(id))
            throw new IllegalStateException(
                "tutorial with id " + id + "does not exist"
            );
        tutorialRepository.deleteById(id);
    }

    public List<Tutorial> getTutorialList() {
        return tutorialRepository.findAll();
    }

    public void updateTutorial(
            Long id, String primaryColor,
            String paragraphToGenerate, String paragraphToRemove) {

        Tutorial tutorial = tutorialRepository
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
                                .generateParagraph(
                                        tutorial.getTopic(),
                                        headline
                                )
                )
        );
    }
}