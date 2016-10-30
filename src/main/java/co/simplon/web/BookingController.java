package co.simplon.web;


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
		for(Booking book:bookingList){
			System.out.println(book.toString());
		}
		return new ModelAndView("booking", model);
	}

	@RequestMapping("/book")
	
    public ModelAndView addBooking(@RequestParam("roomId") int room_id,
            @RequestParam("computerId") int computerId, @RequestParam("starts") @DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm") Date starts, @RequestParam("ends") @DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm") Date ends,
            Integer userId, RedirectAttributes redirectAttributes) {
        Date createdAt = new Date();
        Booking booking = new Booking(room_id, computerId, starts, ends, createdAt , userId);
        if (starts.before(Date.from(Instant.now()))) redirectAttributes.addFlashAttribute("erreur","La date de début est inférieure à la date du jour");
        else if (ends.before(starts)) redirectAttributes.addFlashAttribute("erreur","La date de début est supérieure à la date de fin");
        else if (starts.equals(null)) redirectAttributes.addFlashAttribute("erreur","La date de début est nulle");
        else if (ends.equals(null)) redirectAttributes.addFlashAttribute("erreur","La date de fin est nulle");     
        else if (!bookingService.isAvaibleComputer(computerId, starts, ends)) redirectAttributes.addFlashAttribute("erreur","L'ordinateur est déjà réservé");
        else if (!bookingService.isAvaibleRoom(computerId, starts, ends)) redirectAttributes.addFlashAttribute("erreur","La salle est déjà réservée");
        else bookingService.addOrUpdate(booking);
        return new ModelAndView("redirect:/booking");
    }
	
}
