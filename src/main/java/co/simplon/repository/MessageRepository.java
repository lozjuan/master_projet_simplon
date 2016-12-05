package co.simplon.repository;

import co.simplon.model.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import javax.annotation.Resource;

@Resource
public interface MessageRepository extends JpaRepository<Message, Integer> {

    @Query("select m from Message m where m.id=?1")
    public  Message findMessageById(Integer id);
}
