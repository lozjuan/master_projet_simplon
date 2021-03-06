package co.simplon.service.business;


import co.simplon.model.Message;
import co.simplon.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageService extends GenericService<Message, MessageRepository> {

    @Autowired
    public MessageRepository messageRepository;

    public boolean isTreated(Integer id) {
        Message message = messageRepository.findMessageById(id);
        if (message.getTreated().equals(0)) {
            return true;
        } else {
            return false;
        }
    }

    public String getUserNameByMessageId(Integer id) {
        Message message = messageRepository.findMessageById(id);
        return message.getUserName();
    }
}
