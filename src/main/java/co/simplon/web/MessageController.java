package co.simplon.web;


import co.simplon.model.Message;

import co.simplon.model.User;
import co.simplon.service.business.MessageService;
import co.simplon.service.business.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
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

    @RequestMapping
    public ModelAndView getMessageList(ModelMap model) {
        List<Message> messageList = messageService.getAll();
        model.addAttribute("messageList", messageList);
        return new ModelAndView("message", model);
    }

    @RequestMapping(path = "/sendMessage")
    public ModelAndView sendMessage(@RequestParam("content") String content, String userName) {
        Date createdAt = new Date();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String currentUser = auth.getName();
        Message message = new Message(content, currentUser, createdAt);
        messageService.addOrUpdate(message);
        return new ModelAndView("redirect:/message");
    }

}