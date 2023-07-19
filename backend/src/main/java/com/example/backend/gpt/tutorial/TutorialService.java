package com.example.backend.gpt.tutorial;

import com.example.backend.gpt.ScriptsDirector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        String rawResponse = scriptsDirector.tutorialMaker(topic);

        tutorialRepository.save(
                new Tutorial(
                        repairPolishChars(rawResponse)
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
}