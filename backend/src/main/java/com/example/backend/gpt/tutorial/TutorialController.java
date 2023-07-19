package com.example.backend.gpt.tutorial;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path = "/gpt/tutorial")
public class TutorialController {

    private final TutorialService gptService;

    @SuppressWarnings("unused")
    @Autowired
    public TutorialController(TutorialService tutorialService) {
        this.gptService = tutorialService;
    }

    @PostMapping()
    public void createTutorial(
            @RequestParam String topic
    ) {
        gptService.processTutorialCreation(topic);
    }

    @DeleteMapping(path = "{tutorialId}")
    public void deleteTutorial(
            @PathVariable("tutorialId") Long id
    ) {
        gptService.deleteTutorial(id);
    }
}
