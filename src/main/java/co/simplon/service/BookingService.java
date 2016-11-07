package co.simplon.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.simplon.model.Booking;
import co.simplon.repository.BookingRepository;

@Service
public class BookingService extends GenericService< Booking, BookingRepository > {

	@Autowired
	public BookingRepository bookingRepository;

	public boolean isAvaibleComputer(int id, Date starts, Date ends) {

		List<Booking> list = bookingRepository.findBookingComputer(id);
		if (list.isEmpty())
			return true;
		else
			return false;
	}

	public boolean isAvaibleRoom(int id) {
		List<Booking> list = bookingRepository.findBookingRoom(id);
		if (list.isEmpty())
			return true;
		else
			return false;
	}
}
