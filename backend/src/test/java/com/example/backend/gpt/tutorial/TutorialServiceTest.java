package com.example.backend.gpt.tutorial;

import com.example.backend.gpt.tutorial.scripts.TutorialScriptsDirectorJPS;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.Objects;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.*;

public class TutorialServiceTest {

    @Mock
    private TutorialScriptsDirectorJPS scriptsDirector;

    @Mock
    private TutorialRepository repository;

    @InjectMocks
    private TutorialService service;

    @BeforeEach
    public void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @ParameterizedTest
    @ValueSource(
            strings = {"not in db", "in db", "null"}
    )
    public void processTutorialCreationTest(String topic) {

        if (topic.equals("null")) topic = null;

        when(
                repository.findByTopic("not in db")
        ).thenReturn(
                Optional.empty()
        );

        when(
                repository.findByTopic("in db")
        ).thenReturn(
                Optional.of(new Tutorial())
        );

        when(
                scriptsDirector.generateTutorial(topic)
        ).thenReturn("proper raw data in string");

        //* Method call
        service.processTutorialCreation(topic);

        verify(
                repository, times(1)
        ).findByTopic(topic);

        verify(
                repository, times(
                        Objects.equals(topic, "in db")
                                ? 1 : 0
                )
        ).delete(any());

        verify(
                repository, times(1)
        ).save(any());

        verify(
                scriptsDirector, times(1)
        ).generateTutorial(topic);
    }

    @ParameterizedTest
    @ValueSource(
            longs = {0, 1}
    )
    public void deleteTutorialTest(Long id) {

        when(
                repository.existsById(
                        eq(1L)
                )
        ).thenReturn(true);


        when(
                repository.existsById(
                        eq(0L)
                )
        ).thenReturn(false);

        if (id == 0) {
            assertThrows(
                    IllegalStateException.class,
                    () -> service.deleteTutorial(id)
            );
            return;
        }

        //* Method call
        service.deleteTutorial(id);

        verify(
                repository, times(1)
        ).deleteById(id);
    }

    @Test
    public void getTutorialTest() {

        service.getTutorialList();

        verify(
                repository, times(1)
        ).findAll();

    }

}