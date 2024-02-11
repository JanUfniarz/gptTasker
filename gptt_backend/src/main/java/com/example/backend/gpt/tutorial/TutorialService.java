package com.example.backend.gpt.tutorial;

import com.example.backend.gpt.TaskerService;
import com.example.backend.gpt.tutorial.scripts.TutorialScriptsDirector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TutorialService extends TaskerService {

    @Autowired
    public TutorialService(
            TutorialScriptsDirector tutorialScriptsDirector,
            TutorialRepository tutorialRepository
    ) {
        super.scriptsDirector = tutorialScriptsDirector;
        super.repository = tutorialRepository;
    }

    private TutorialRepository tRepository() {
        return (TutorialRepository) repository;
    }

    @Override
    public void processTaskCreation(String topic) {
        tRepository()
                .findByTopic(topic)
                .ifPresent(tRepository()::delete);

        tRepository().save(
                new Tutorial(
                        repairPolishChars(
                                scriptsDirector
                                        .create(topic)
                        )
                )
        );
    }

    public void updateTutorial(
            Long id, String primaryColor,
            String paragraphToGenerate, String paragraphToRemove
    ) {
        Tutorial tutorial = tRepository()
                .findById(id)
                .orElseThrow();

        if (!primaryColor.equals("<@null>")) tutorial.setPrimaryColor(primaryColor);

        if (!paragraphToGenerate.equals("<@null>")) {
            Paragraph newParagraph = crateParagraph(
                    tutorial, paragraphToGenerate
            );
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

        if (!paragraphToRemove.equals("<@null>"))
            tutorial.removeParagraph(paragraphToRemove);

        tRepository().save(tutorial);
    }

    private Paragraph crateParagraph(Tutorial tutorial, String headline) {
        return new Paragraph(
                repairPolishChars(
                        ((TutorialScriptsDirector) scriptsDirector)
                                .create(
                                        tutorial.getTopic(),
                                        headline
                                )
                                .replaceAll("<@start>", "")
                                .replaceAll("<@end>", "")
                )
        );
    }
}