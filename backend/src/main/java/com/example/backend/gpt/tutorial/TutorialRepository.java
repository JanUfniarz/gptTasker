package com.example.backend.gpt.tutorial;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface TutorialRepository extends JpaRepository<Tutorial, Long> {

    @Query("SELECT t FROM Tutorial WHERE t.topic = ?1")
    Optional<Tutorial> findByTopic(String topic);
}