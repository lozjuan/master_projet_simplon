package co.simplon.service.Mailer;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;


@Service("SimplonEmail")
public class SimplonEmailAPI {

    @Autowired
    private MailSender simplonEmail;

    public void SendEmail(String toAddress, String fromAddress, String subject, String msgBody) {

        SimpleMailMessage simplonMsg = new SimpleMailMessage();
        simplonMsg.setFrom(fromAddress);
        simplonMsg.setTo(toAddress);
        simplonMsg.setSubject(subject);
        simplonMsg.setText(msgBody);
        simplonEmail.send(simplonMsg);
    }
}