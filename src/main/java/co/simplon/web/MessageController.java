package co.simplon.web;


import co.simplon.model.Message;

import co.simplon.model.User;
import co.simplon.service.Mailer.SimplonEmailAPI;
import co.simplon.service.business.MessageService;
import co.simplon.service.business.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/message")
public class MessageController {


    @Autowired
    private MessageService messageService;

    @Autowired
    private UserService userService;

    @Autowired
    private SimplonEmailAPI simplonEmailAPI;

    @RequestMapping
    public ModelAndView getMessageList(ModelMap model) {
        List<Message> messageList = messageService.getAll();
        model.addAttribute("messageList", messageList);
        return new ModelAndView("message/message", model);
    }

    @RequestMapping(path = "/sendMessage", method = RequestMethod.POST)
    public ModelAndView sendMessage(@RequestParam("content") String content, String userName) {
        Date createdAt = new Date();
        Date treatedAt = null;
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String currentUser = auth.getName();
        Message message = new Message(content, currentUser, createdAt, 0, treatedAt);
        messageService.addOrUpdate(message);
        return new ModelAndView("redirect:/message");
    }

    @RequestMapping(path = "/setMessageAsTreated")
    public ModelAndView setMessageAsTreated(Integer id) {
        Message message = messageService.findById(id);
        if (messageService.isTreated(message.getId())) {
            message.setTreated(1);
            message.setTreatedAt(new Date());
            messageService.addOrUpdate(message);
        }
        return new ModelAndView("redirect:/message");
    }

    @RequestMapping(path = "/reply")
    public ModelAndView replyMessage(Integer idMessage, ModelMap model) {
        Message message = messageService.findById(idMessage);
        String email = messageService.getUserNameByMessageId(message.getId());
        model.addAttribute("email", email);
        return new ModelAndView("message/replyMessage", model);
    }

    @RequestMapping(path = "/sendReply", method = RequestMethod.POST)
    public ModelAndView sendReplyMessage(String body, String email) {
        String from = "simplonreservation@gmail.com";
        String subject = "Simplon reservation";
        simplonEmailAPI.SendEmail(email, from, subject, body);
        return new ModelAndView("message/replyMessageSent");
    }
}