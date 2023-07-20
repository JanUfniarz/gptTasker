package com.example.backend.gpt.tutorial;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/gpt/tutorial")
public class TutorialController {

    private final TutorialService tutorialService;

    @SuppressWarnings("unused")
    @Autowired
    public TutorialController(TutorialService tutorialService) {
        this.tutorialService = tutorialService;
    }

    @PostMapping
    public void createTutorial(
            @RequestParam String topic
    ) {
        tutorialService.processTutorialCreation(topic);
    }

    @DeleteMapping(path = "{tutorialId}")
    public void deleteTutorial(
            @PathVariable("tutorialId") Long id
    ) {
        tutorialService.deleteTutorial(id);
    }

    @GetMapping
    @ResponseBody
    public List<Tutorial> getTutorial() {
        return tutorialService.getTutorialList();
    }

    @PutMapping
    public void updateTutorial(

            @PathVariable("tutorialId")
            Long id,

            @RequestParam(required = false)
            String primaryColor,

            @RequestParam(required = false)
            String paragraphToGenerate,

            @RequestParam(required = false)
                    String paragraphToRemove
    ) {
        tutorialService.updateTutorial(
                id, primaryColor,
                paragraphToGenerate, paragraphToRemove
        );
    }
}
