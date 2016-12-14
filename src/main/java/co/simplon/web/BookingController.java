package co.simplon.web;

import java.io.IOException;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.annotations.Expose;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.simplon.model.Booking;
import co.simplon.model.Computer;
import co.simplon.model.Room;
import co.simplon.model.User;
import co.simplon.service.business.BookingService;
import co.simplon.service.business.ComputerService;
import co.simplon.service.business.RoomService;
import co.simplon.service.business.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        return new ModelAndView("booking/booking", model);
    }

    @RequestMapping("/modifyBookingForm")
    public ModelAndView getModifyBooking(@RequestParam Integer id, ModelMap model, RedirectAttributes redirectAttributes) {
        Booking booking = bookingService.findById(id);
        model.addAttribute("booking", booking);
        List<Room> roomList = roomService.getAll();
        model.addAttribute("roomList", roomList);
        List<Computer> computerList = computerService.getAll();
        model.addAttribute("computerList", computerList);
        List<User> userList = userService.getAll();
        model.addAttribute("userList", userList);
        return new ModelAndView("booking/modifyBooking", model);
    }

    @RequestMapping("/book")
    public ModelAndView addBooking(@RequestParam(name = "roomId", defaultValue = "-1") Integer roomId,
                                   @RequestParam(name = "computerId", defaultValue = "-1") Integer computerId,
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
    public ModelAndView modifyBooking(@RequestParam("id") Integer id, ModelMap model) {
        Booking booking = bookingService.findById(id);
        model.addAttribute("booking", booking);
        return new ModelAndView("booking/modifyBooking", model);
    }

    @RequestMapping("/modifyBookingWithInput")
    public ModelAndView modifyBookingWithInput(@RequestParam("id") Integer id, @RequestParam(name = "roomId", defaultValue = "-1") Integer roomId,
                                               @RequestParam(name = "computerId", defaultValue = "-1") Integer computerId,
                                               @RequestParam("starts") @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") Date starts,
                                               @RequestParam("ends") @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") Date ends, Integer userId,
                                               RedirectAttributes redirectAttributes, ModelMap model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Booking booking = bookingService.findById(id);
        Computer computer = computerService.findById(computerId);
        Room room = roomService.findById(roomId);
        User user = userService.findById(userId);
        String currentUser = auth.getName();
        Collection<? extends GrantedAuthority> currentUserRole = auth.getAuthorities();
        if (booking.getUser().getEmail().equals(currentUser) || currentUserRole.toString().equals("[admin]")) {
            booking.setComputer(computer);
            booking.setRoom(room);
            booking.setUser(user);
            booking.setStarts(starts);
            booking.setEnds(ends);
            return testBooking(roomId, computerId, starts, ends, redirectAttributes, booking);
        } else {
            redirectAttributes.addFlashAttribute("erreur", "Vous n'avez pas le droit");
        }
        return new ModelAndView("redirect:/booking");
    }

	private ModelAndView testBooking(Integer roomId, Integer computerId, @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") Date starts,@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") Date ends,
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

    //Converts bookings to format expected by FullCalendar
    public static class BookingForJson {
        private Booking booking;
        @Expose
        private Date start;
        @Expose
        private Date end;
        @Expose
        private String title;

        public BookingForJson(Booking booking) {
            this.booking = booking;
            this.start = booking.getStarts();
            this.end = booking.getEnds();
            this.title = booking.getTitle();
        }

        public Date getStart() {
            return start;
        }

        public Date getEnd() {
            return end;
        }

        public String getTitle() {
            return title;
        }
    }

    @RequestMapping("/getCalendarBookings")
    @ResponseBody
    public String getCalendarBookings(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Booking> bookings = bookingService.getAll();
        List<BookingForJson> bookingsForJson = new ArrayList<>();
        for (Booking booking : bookings) {
            bookingsForJson.add(new BookingForJson(booking));
        }
        Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().setDateFormat("yyyy-MM-dd'T'HH:mm:ss").create();
        String json = gson.toJson(bookingsForJson);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        return json;
    }
}
