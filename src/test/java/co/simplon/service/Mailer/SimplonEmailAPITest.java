package co.simplon.service.Mailer;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/spring-config.xml", "/mailer-config.xml"})
@WebAppConfiguration
public class SimplonEmailAPITest {

    @Autowired
    SimplonEmailAPI simplonEmailAPI;

    @Test
    public void sendEmail() throws Exception {

        String to = "lozjuan@gmail.com";
        String from = "simplonreservation@gmail.com";

        // email subject
        String subject = "Hey.. This email sent by Simplon";

        // email body
        String body = "There you go.. You got an email..";
        simplonEmailAPI.SendEmail(to, from, subject, body);
    }

}