package co.simplon.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

    public ModelAndView getCalendar(ModelMap model) {
        return new ModelAndView("booking", model);
    }
}
