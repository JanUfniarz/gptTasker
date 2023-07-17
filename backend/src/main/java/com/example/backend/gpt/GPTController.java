package com.example.backend.gpt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/gpt")
public class GPTController {

    private final GPTService gptService;

    @SuppressWarnings("unused")
    @Autowired
    public GPTController(GPTService gptService) {
        this.gptService = gptService;
    }

    @PutMapping(path = "/tutorial")
    public void createTutorial(
            @RequestParam String topic
    ) {
        gptService.processTutorialCreation(topic);
    }
}
