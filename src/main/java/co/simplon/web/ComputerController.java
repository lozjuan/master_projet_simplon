package co.simplon.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.simplon.model.Computer;
import co.simplon.service.business.ComputerService;


@Controller
@RequestMapping("/computer")
public class ComputerController {

	@Autowired
	private ComputerService computerService;

	@RequestMapping
	public ModelAndView getComputerList(ModelMap model) {
		List<Computer> computerList = computerService.getAll();
		model.addAttribute("computerList", computerList);
		return new ModelAndView("computer", model);
	}

	@RequestMapping("/computerById")
	public ModelAndView getById(@RequestParam("id") Integer id, ModelMap model) {
		Computer computer = computerService.findById(id);
		model.addAttribute("computer", computer);
		return new ModelAndView("search-pc", model);
	}

	@RequestMapping("/addComputer")
	public ModelAndView addComputer(@RequestParam("brand") String brand, @RequestParam("model") String model,
			String serial) {
		Computer computer = new Computer(brand, model, serial);
		computerService.addOrUpdate(computer);
		return new ModelAndView("redirect:/computer");
	}
	
	@RequestMapping("/modifyComputer")
	public ModelAndView modifyComputer(@RequestParam("id") Integer id,ModelMap model) {
		Computer computer=computerService.findById(id);
		model.addAttribute("computer",computer);
		return new ModelAndView("modifyComputer",model);
	}
	
	@RequestMapping("/modifyComputerWithInput")
	public ModelAndView modifyComputerWithInput(@RequestParam("id") Integer id,@RequestParam("brand") String brand, @RequestParam("model") String model,
			String serial, ModelMap modele){
		
		Computer computer = computerService.findById(id);
		computer.setBrand(brand);
		computer.setModel(model);
		computer.setSerial(serial);
		computerService.addOrUpdate(computer);
		return new ModelAndView("redirect:/computer");
	}
	
	

	@RequestMapping("/deleteComputer")
	public ModelAndView deleteComputer(@RequestParam("id") Integer id) {
		computerService.delete(id);
		return new ModelAndView("redirect:/computer");
	}

}
