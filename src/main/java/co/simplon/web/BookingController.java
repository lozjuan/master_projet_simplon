package co.simplon.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.simplon.model.Booking;
import co.simplon.model.Computer;
import co.simplon.model.Room;
import co.simplon.model.User;
import co.simplon.service.BookingService;
import co.simplon.service.ComputerService;
import co.simplon.service.RoomService;
import co.simplon.service.UserService;

@Controller
@RequestMapping
public class BookingController {

	@Autowired
	public BookingService bookingService;

	@Autowired
	public ComputerService computerService;

	@Autowired
	public RoomService roomService;

	@Autowired
	public UserService userService;

	@RequestMapping("/booking")
	public ModelAndView getBookingList(ModelMap model) {
		List<Booking> bookingList = bookingService.getAll();
		model.addAttribute("bookingList", bookingList);

		for(Booking book:bookingList){
			System.out.println(book.toString());
		}
		List<Room> roomList = roomService.getAll();
		model.addAttribute("roomList", roomList);
		List<Computer> computerList = computerService.getAll();
		model.addAttribute("computerList", computerList);
		List<User> userList = userService.getAll();
		model.addAttribute("userList", userList);
		return new ModelAndView("booking", model);
	}
	
	@RequestMapping("/modifyBookingForm")
	public ModelAndView getModifyBooking(@RequestParam Integer id,ModelMap model) {
		Booking booking=bookingService.findById(id);
		model.addAttribute("booking",booking);
		List<Room> roomList = roomService.getAll();
		model.addAttribute("roomList", roomList);
		List<Computer> computerList = computerService.getAll();
		model.addAttribute("computerList", computerList);
		List<User> userList = userService.getAll();
		model.addAttribute("userList", userList);
		return new ModelAndView("modifyBooking", model);
	}	
	
	
	// Pour test de format de l'heure.
	public static void main(String args[]) {
		SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		try {
			Date date = d.parse("2016-10-29T08:00");
			System.out.println(d.format(date));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping("/book")

	public ModelAndView addBooking(@RequestParam(name="roomId",defaultValue="-1") Integer roomId,
			@RequestParam(name="computerId",defaultValue="-1") Integer computerId,
			@RequestParam("starts") @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") Date starts,
			@RequestParam("ends") @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") Date ends, Integer userId,
			RedirectAttributes redirectAttributes) {

		Date createdAt = new Date();
		Computer computer = computerService.findById(computerId);
		Room room = roomService.findById(roomId);
		User user = userService.findById(userId);
		Booking booking = new Booking(room, computer, starts, ends, createdAt, user);

        return testBooking(roomId, computerId, starts, ends, redirectAttributes, booking);
    }
	


	@RequestMapping("/deleteBook")
	public ModelAndView deleteBooking(@RequestParam("id") Integer id, ModelMap model) {
		bookingService.delete(id);
		return new ModelAndView("redirect:/booking");
	}
	@RequestMapping("/modifyBook")
	public ModelAndView modifyBooking(@RequestParam("id") Integer id,ModelMap model) {
		Booking booking=bookingService.findById(id);
		model.addAttribute("booking",booking);
		return new ModelAndView("modifyBooking",model);
	}
	
	@RequestMapping("/modifyBookingWithInput")
	public ModelAndView modifyBookingWithInput(@RequestParam("id") Integer id,@RequestParam(name="roomId",defaultValue="-1") Integer roomId,
			@RequestParam(name="computerId",defaultValue="-1") Integer computerId,
			@RequestParam("starts") @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") Date starts,
			@RequestParam("ends") @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") Date ends, Integer userId,
			RedirectAttributes redirectAttributes, ModelMap model){
		
		Booking booking = bookingService.findById(id);
		Computer computer = computerService.findById(computerId);
		Room room = roomService.findById(roomId);
		User user = userService.findById(userId);
		booking.setComputer(computer);
		booking.setRoom(room);
		booking.setUser(user);
		booking.setStarts(starts);
		booking.setEnds(ends);
		
		return testBooking(roomId, computerId, starts, ends, redirectAttributes, booking);
	}

	private ModelAndView testBooking(Integer roomId, Integer computerId, Date starts, Date ends,
			RedirectAttributes redirectAttributes, Booking booking) {
		if (starts.before(Date.from(Instant.now()))) redirectAttributes.addFlashAttribute("erreur","La date de début est inférieure à la date du jour");
        else if (ends.before(starts)) redirectAttributes.addFlashAttribute("erreur","La date de début est supérieure à la date de fin");
        else if (starts.equals(null)) redirectAttributes.addFlashAttribute("erreur","La date de début est nulle");
        else if (ends.equals(null)) redirectAttributes.addFlashAttribute("erreur","La date de fin est nulle");  
        else if ((roomId == -1) && (computerId == -1)) redirectAttributes.addFlashAttribute("erreur","Vous n'avez réservé ni salle ni ordinateur"); 
        else if ((!bookingService.isAvaibleComputer(computerId, starts, ends)) && (!bookingService.isAvaibleRoom(roomId,starts,ends))) redirectAttributes.addFlashAttribute("erreur","L'ordinateur et la salle sont déjà réservés");
        else if (!bookingService.isAvaibleComputer(computerId, starts, ends)) redirectAttributes.addFlashAttribute("erreur","L'ordinateur est déjà réservé");
        else if (!bookingService.isAvaibleRoom(roomId,starts,ends)) redirectAttributes.addFlashAttribute("erreur","La salle est déjà réservée");
        else bookingService.addOrUpdate(booking);
        return new ModelAndView("redirect:/booking");
	}

	
}
