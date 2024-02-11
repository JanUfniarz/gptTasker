package com.example.backend.gpt.quiz;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface QuizRepository extends JpaRepository<Quiz, Long> {
//    @Query(
//            "SELECT q FROM Quiz q WHERE q.topic = ?1"
//    )
//    Optional<Quiz> findByTopic(String topic);
}


