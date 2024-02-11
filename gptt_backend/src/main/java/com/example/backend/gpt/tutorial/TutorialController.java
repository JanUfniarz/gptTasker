package com.example.backend.gpt.tutorial;

import com.example.backend.gpt.TaskerController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path = "v1/gpt/tutorial")
public class TutorialController extends TaskerController {

    @SuppressWarnings("unused")
    @Autowired
    public TutorialController(TutorialService tutorialService) {
        super.service = tutorialService;
    }

    @PutMapping(path = "{Id}")
    public void updateTutorial(

            @PathVariable("Id")
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
        ((TutorialService) service).updateTutorial(
                id, primaryColor,
                paragraphToGenerate, paragraphToRemove
        );
    }
}