package co.simplon.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import co.simplon.model.Computer;
import co.simplon.service.ComputerService;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/computer")
public class ComputerController {

	@Autowired
	private ComputerService computerService;

	
	@RequestMapping
	public ModelAndView getById(@RequestParam("id") Integer id, ModelMap model) {
		Computer computer = computerService.findById(id);
		model.addAttribute("computer", computer);
		return new ModelAndView("computer", model);
	}
}
