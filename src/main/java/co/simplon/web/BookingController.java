package co.simplon.web;


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
import co.simplon.service.BookingService;

@Controller
@RequestMapping
public class BookingController {

	@Autowired
	public BookingService bookingService;

	@RequestMapping("/booking")
	public ModelAndView getBookingList(ModelMap model) {
		List<Booking> bookingList = bookingService.getAll();
		model.addAttribute("bookingList", bookingList);
		return new ModelAndView("booking", model);
	}

	@RequestMapping("/book")
	public ModelAndView addBooking(@RequestParam("roomName") String roomName,
			@RequestParam("computerId") String computerId, @RequestParam("starts") @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") Date starts, @RequestParam("ends") @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") Date ends,
			Integer userId) {
		Date createdAt = new Date();
		Booking booking = new Booking(roomName, computerId, starts, ends, createdAt , userId);
		bookingService.addOrUpdate(booking);
		return new ModelAndView("redirect:/booking");
	}
}
