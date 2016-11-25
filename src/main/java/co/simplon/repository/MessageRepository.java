package co.simplon.repository;

import co.simplon.model.Message;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.annotation.Resource;

@Resource
public interface MessageRepository extends JpaRepository<Message, Integer> {
}
