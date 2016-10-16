package co.simplon.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.simplon.model.User;
import co.simplon.service.UserService;

@Controller
@RequestMapping
public class UserController {

	@Autowired
	public UserService userService;

	@RequestMapping("/user")
	public ModelAndView getList(ModelMap model) {
		List<User> userList = userService.getAll();
		model.addAttribute("userList", userList);
		return new ModelAndView("user", model);
	}

	@RequestMapping("/userById")
	public ModelAndView getById(@RequestParam("id") Integer id, ModelMap model) {
		User user = userService.findById(id);
		model.addAttribute("user", user);
		return new ModelAndView("search-user", model);
	}

	@RequestMapping("/addUser")
	public ModelAndView addUser(@RequestParam("name") String name, @RequestParam("surname") String surname,
			String email, String userRights) {
		User user = new User(name, surname, email, userRights);
		userService.addOrUpdate(user);
		return new ModelAndView("redirect:/user");
	}

	@RequestMapping("/deleteUser")
	public ModelAndView deleteRoom(@RequestParam("id") Integer id, ModelMap model) {
		userService.delete(id);
		return new ModelAndView("redirect:/user");
	}

}
