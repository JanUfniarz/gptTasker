package com.example.backend;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class User {

    private String name;
    private String email;
    private int pin;

    private static User example;

    public static User getExample() {
        if (example == null) return new User(
                "Adam",
                "adam@example.com",
                1234
        );
        return example;
    }
}
