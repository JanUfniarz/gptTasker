package com.example.backend.gpt.tutorial;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "v1/gpt/tutorial")
public class TutorialController {

    private final TutorialService service;

    @SuppressWarnings("unused")
    @Autowired
    public TutorialController(TutorialService tutorialService) {
        this.service = tutorialService;
    }

    @PostMapping
    public void createTutorial(
            @RequestParam String topic
    ) {
        service.processTutorialCreation(topic);
    }

    @DeleteMapping(path = "{tutorialId}")
    public void deleteTutorial(
            @PathVariable("tutorialId") Long id
    ) {
        service.deleteTutorial(id);
    }

    @GetMapping
    @ResponseBody
    public List<Tutorial> getTutorial() {
        return service.getTutorialList();
    }

    @PutMapping(path = "{tutorialId}")
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
        System.out.println(
                "== controller ==" +
                "\nid: " + id +
                "\nprimaryColor: " + primaryColor +
                "\nparagraphToGenerate: " + paragraphToGenerate +
                "\nparagraphToRemove: " + paragraphToRemove
        );
        service.updateTutorial(
                id, primaryColor,
                paragraphToGenerate, paragraphToRemove
        );
    }
}
