package com.example.backend.gpt;

import jakarta.persistence.MappedSuperclass;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@MappedSuperclass
public abstract class Task {

    protected String primaryColor;

    protected String topic;

}