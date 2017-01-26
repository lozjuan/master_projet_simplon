package co.simplon.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
        return new ModelAndView("computer/computer", model);
    }

    @RequestMapping(path = "/computerById")
    public ModelAndView getById(@RequestParam("id") Integer id, ModelMap model, RedirectAttributes redirectAttr) {
        try {
            Computer computer = computerService.findById(id);
            model.addAttribute("computer", computer);
        } catch (Exception e) {
            redirectAttr.addFlashAttribute("erreur", "merci d'insérer l'Id de l'utilisateur.");
            return new ModelAndView("redirect:/computer");
        }
        return new ModelAndView("computer/searchPc", model);
    }

    @RequestMapping(path = "/addComputer", method = RequestMethod.POST)
    public ModelAndView addComputer(@RequestParam("brand") String brand, @RequestParam("model") String model,
                                    String serial, RedirectAttributes redirectAttr) {
        if (brand.isEmpty()) redirectAttr.addFlashAttribute("erreur", "Merci de renseigner le marque");
        else if (model.isEmpty()) redirectAttr.addFlashAttribute("erreur", "Merci de renseigner le model");
        else if (serial.isEmpty()) redirectAttr.addFlashAttribute("erreur", "Merci de renseigner le serial");
        else  {
            Computer computer = new Computer(brand, model, serial);
            computerService.addOrUpdate(computer);
        }
        return new ModelAndView("redirect:/computer");
    }

    @RequestMapping("/modifyComputer")
    public ModelAndView modifyComputer(@RequestParam("id") Integer id, ModelMap model) {
        Computer computer = computerService.findById(id);
        model.addAttribute("computer", computer);
        return new ModelAndView("computer/modifyComputer", model);
    }

    @RequestMapping("/modifyComputerWithInput")
    public ModelAndView modifyComputerWithInput(@RequestParam("id") Integer id, @RequestParam("brand") String brand, @RequestParam("model") String model,
                                                String serial, ModelMap modele) {
        Computer computer = computerService.findById(id);
        computer.setBrand(brand);
        computer.setModel(model);
        computer.setSerial(serial);
        computerService.addOrUpdate(computer);
        return new ModelAndView("redirect:/computer");
    }

    @RequestMapping(path = "/deleteComputer")
    public ModelAndView deleteComputer(@RequestParam("id") Integer id, RedirectAttributes redirectAttr) {
    	try{
        computerService.delete(id);}
    	catch(Exception e){
    		redirectAttr.addFlashAttribute("erreur","Erreur, l'ordinateur est certainement déjà réservé.");
    	}
        return new ModelAndView("redirect:/computer");
    }
}