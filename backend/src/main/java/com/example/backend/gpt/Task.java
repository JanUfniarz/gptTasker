package com.example.backend.gpt;

import lombok.Getter;
import lombok.Setter;

public abstract class Task {

    @Getter
    @Setter
    protected String primaryColor;

    @Getter
    @Setter
    protected String topic;

}