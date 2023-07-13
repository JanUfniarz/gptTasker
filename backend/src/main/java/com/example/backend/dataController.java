package com.example.backend;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path = "api/v1/data")
public class dataController {

    @GetMapping
    public User data() {
        return User.getExample();
    }

    @PostMapping
    public void addUser(
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String pin
            ) {
        User.setExample(new User(name, email, Integer.parseInt(pin)));
    }

    @DeleteMapping
    public void deleteUser() {
        User.setExample(null);
    }
}