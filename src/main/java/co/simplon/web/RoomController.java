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

import co.simplon.model.Room;
import co.simplon.service.business.RoomService;

@Controller
@RequestMapping("/room")
public class RoomController {

	public RoomController() {
		super();
	}

	public RoomController(RoomService roomService) {
		super();
		this.roomService = roomService;
	}

	@Autowired
	private RoomService roomService;

	@RequestMapping
	public ModelAndView getList(ModelMap model) {
		List<Room> roomList = roomService.getAll();
		model.addAttribute("roomList", roomList);
		return new ModelAndView("room/room", model);
	}

	@RequestMapping(path="/roomById")
	public ModelAndView getById(@RequestParam("id") Integer id, ModelMap model, RedirectAttributes redirectAttr) {
		try {
			Room room = roomService.findById(id);
			model.addAttribute("room", room);
		} catch (Exception e) {
			redirectAttr.addFlashAttribute("erreur", "merci d'insérer l'Id de la salle.");
			return new ModelAndView("redirect:/room");
		}
		return new ModelAndView("room/searchRoom", model);
	}

	@RequestMapping(path="/addRoom", method = RequestMethod.POST)
	public ModelAndView addRoom(@RequestParam("name") String name, @RequestParam("places") Integer places,
			String description,  RedirectAttributes redirectAttr) {
		if (name.isEmpty()) redirectAttr.addFlashAttribute("erreur", "Merci de renseigner le nom de la salle");
		else if (places == null) redirectAttr.addFlashAttribute("erreur", "Merci de renseigner le places disponibles");
		else if (description.isEmpty()) redirectAttr.addFlashAttribute("erreur", "Merci de renseigner la description");
		else  {
			Room room = new Room(name, places, description);
			roomService.addOrUpdate(room);
		}
		return new ModelAndView("redirect:/room");
	}

	@RequestMapping(path="/deleteRoom")
	public ModelAndView deleteRoom(@RequestParam("id") Integer id, ModelMap model, RedirectAttributes redirectAttr) {
		try {
		roomService.delete(id);
		}
		catch(Exception e)
		{
		redirectAttr.addFlashAttribute("erreur","Erreur, la salle est certainement déjà réservée.");
		}
		return new ModelAndView("redirect:/room");
	}
	
	@RequestMapping("/modifyRoom")
	public ModelAndView modifyComputer(@RequestParam("id") Integer id,ModelMap model) {
		Room room=roomService.findById(id);
		model.addAttribute("room",room);
		return new ModelAndView("room/modifyRoom",model);
	}
	
	@RequestMapping("/modifyRoomWithInput")
	public ModelAndView modifyComputerWithInput(@RequestParam("id") Integer id,@RequestParam("name") String name, @RequestParam("places") Integer places,
			String description, ModelMap model) {
		Room room = roomService.findById(id);
		room.setName(name);
		room.setPlaces(places);
		room.setDescription(description);
		roomService.addOrUpdate(room);
		return new ModelAndView("redirect:/room");
	}
}