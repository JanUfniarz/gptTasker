package com.example.backend.gpt.tutorial;

import com.example.backend.TaskerService;
import com.example.backend.gpt.tutorial.scripts.TutorialScriptsDirector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TutorialService extends TaskerService {

    private final TutorialScriptsDirector scriptsDirector;

    private final TutorialRepository repository;

    @Autowired
    public TutorialService(
            TutorialScriptsDirector tutorialScriptsDirector,
            TutorialRepository tutorialRepository
    ) {
        this.scriptsDirector = tutorialScriptsDirector;
        this.repository = tutorialRepository;
    }

    @Override
    public void processTaskCreation(String topic) {
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

    @Override
    public void deleteTask(Long id) {
        if (!repository.existsById(id))
            throw new IllegalStateException(
                "tutorial with id " + id + " do not exist"
            );
        repository.deleteById(id);
    }

    @Override
    public List<Object> getTaskList() {
        List<Tutorial> tutorials = repository.findAll();

        tutorials.forEach(
                tutorial -> System.out.println(
                        tutorial.getParagraphs()
                                .stream()
                                .findFirst()
                                .orElse(new Paragraph(
                                        "", "no paragraph found"
                                ))
                                .getBody()
                )
        );

        return tutorials.stream()
                .map(tutorial -> (Object) tutorial)
                .toList();
    }

    public void updateTutorial(
            Long id, String primaryColor,
            String paragraphToGenerate, String paragraphToRemove
    ) {
        System.out.println("Metoda updateTutorial - id: "
                + id);
        System.out.println("Metoda updateTutorial - primaryColor: "
                + primaryColor);
        System.out.println("Metoda updateTutorial - paragraphToGenerate: "
                + paragraphToGenerate);
        System.out.println("Metoda updateTutorial - paragraphToRemove: "
                + paragraphToRemove);

        Tutorial tutorial = repository
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

        repository.save(tutorial);
    }

    private Paragraph crateParagraph(Tutorial tutorial, String headline) {
        return new Paragraph(
                repairPolishChars(
                        scriptsDirector
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