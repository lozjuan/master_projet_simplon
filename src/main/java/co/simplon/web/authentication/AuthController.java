package co.simplon.web.authentication;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.simplon.model.TokenPasswordRecovery;
import co.simplon.model.User;
import co.simplon.service.Mailer.SimplonEmailAPI;
import co.simplon.service.authentication.TokenPasswordRecoveryService;
import co.simplon.service.business.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping
public class AuthController {

    @Autowired
    public UserService userService;

    @Autowired
    public TokenPasswordRecoveryService tokenPasswordRecoveryService;

    @Autowired
    SimplonEmailAPI simplonEmailAPI;

    @RequestMapping(value = "/login")
    public ModelAndView loginPage() {
        return new ModelAndView("authentication/login");
    }

    @RequestMapping(value = "/logout")
    public ModelAndView logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return new ModelAndView("authentication/login");
    }

    @RequestMapping("/changePassword")
    public ModelAndView forgotPassword() {
        return new ModelAndView("/authentication/changingPassword");
    }

    @RequestMapping("/emailChangePassword")
    @ResponseBody
    public ModelAndView emailChangePassword(@RequestParam(name = "email") String email) {
        User user = userService.authenticateUser(email);

        if (user == null) {
            throw new UsernameNotFoundException("User name not found");
        } else {
            TokenPasswordRecovery token = new TokenPasswordRecovery(user);
            tokenPasswordRecoveryService.addOrUpdate(token);

            String to = user.getEmail();
            String from = "simplonreservation@gmail.com";
            String subject = "réinitialisez votre mot de passe";
            String url = "http://localhost:8080/emailChangePasswordWithToken?email=" + user.getEmail() + "&token=" + token.getToken();
            String body = "Voici l'url qui vous permettra de réinitialiser votre mot de passe : " + url;
            simplonEmailAPI.SendEmail(to, from, subject, body);
            return new ModelAndView("message/recoveryMessageSent");
        }
    }

    @RequestMapping("/emailChangePasswordWithToken")
    public ModelAndView emailChangePasswordWithToken(@RequestParam(name = "email") String email,
                                                     @RequestParam(name = "token") String tokenAsString,
                                                     ModelMap model) {
        TokenPasswordRecovery token = tokenPasswordRecoveryService.getTokenPasswordRecovery(tokenAsString);
        if (tokenPasswordRecoveryService.isTokenExpired(token)) {
            return new ModelAndView("authentication/settingNewPassword", model);
        }
        //TODO exception !
        return new ModelAndView("authentication/changingPassword", model);
    }

    @RequestMapping("/saveNewPassword")
    public ModelAndView changePassword(String email, String newPassword, String newPasswordControl, ModelMap model, RedirectAttributes redirectAttributes) {
        if (email.isEmpty()) redirectAttributes.addFlashAttribute("erreur", "Merci de rentrer votre email");
        else if (newPassword.isEmpty()) redirectAttributes.addFlashAttribute("erreur", "Merci de rentrer votre password");
        else if (newPasswordControl.isEmpty()) redirectAttributes.addFlashAttribute("erreur", "Merci de rentrer votre password deux fois");
        else if (!newPassword.equals(newPasswordControl)) redirectAttributes.addFlashAttribute("erreur", "les deux passwords doivent être identiques");
        else {
            User user = userService.authenticateUser(email);
            PasswordEncoder encoder = new BCryptPasswordEncoder();
            user.setPassword(encoder.encode(newPassword));
            userService.addOrUpdate(user);
            return new ModelAndView("authentication/changedPassword", model);
        }
        return new ModelAndView("redirect:/newPassword", model);
    }

    @RequestMapping("/newPassword")
    public ModelAndView changePasswordWithOutToken(ModelMap model) {
        return new ModelAndView("authentication/settingNewPassword", model);
    }

    @RequestMapping(value = "/calendar")
    public ModelAndView getHomePage() {
        return new ModelAndView("calendar/calendar");
    }
}
