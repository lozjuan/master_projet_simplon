package co.simplon.service.business;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.simplon.model.Booking;
import co.simplon.repository.BookingRepository;
import co.simplon.service.business.GenericService;

@Service
public class BookingService extends GenericService< Booking, BookingRepository > {

	@Autowired
	public BookingRepository bookingRepository;

	public boolean isAvaibleComputer(int id, Date starts, Date ends) {

		List<Booking> list = bookingRepository.findBookingComputer(id, starts, ends);
		if (list.isEmpty())
			return true;
		else
			return false;
	}

	public boolean isAvaibleRoom(int id, Date starts, Date ends) {
		List<Booking> list = bookingRepository.findBookingRoom(id, starts, ends);
		if (list.isEmpty())
			return true;
		else
			return false;
	}
}
