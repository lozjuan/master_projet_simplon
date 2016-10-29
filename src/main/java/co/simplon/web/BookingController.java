package co.simplon.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
		List<Room> roomList = roomService.getAll();
		model.addAttribute("roomList", roomList);
		List<Computer> computerList = computerService.getAll();
		model.addAttribute("computerList", computerList);
		List<User> userList = userService.getAll();
		model.addAttribute("userList", userList);
		return new ModelAndView("booking", model);
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
	public ModelAndView addBooking(@RequestParam("roomId") Integer roomId,
			@RequestParam("computerId") Integer computerId,
			@RequestParam("starts") @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") Date starts,
			@RequestParam("ends") @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") Date ends, Integer userId) {
		Date createdAt = new Date();
		Computer computer = computerService.findById(computerId);
		Room room = roomService.findById(roomId);
		User user = userService.findById(userId);
		Booking booking = new Booking(room, computer, starts, ends, createdAt, user);
		bookingService.addOrUpdate(booking);
		return new ModelAndView("redirect:/booking");
	}
}
