package co.simplon.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.simplon.model.Booking;
import co.simplon.repository.BookingRepository;

@Repository
public class BookingService {


	@Autowired
	public BookingRepository bookingRepository;

	public List<Booking> getAll() {
		return bookingRepository.findAll();
	}

	public Booking findById(Integer id) {
		return bookingRepository.findOne(id);
	}

	public Booking addOrUpdate(Booking booking) {
		return bookingRepository.save(booking);
	}

	public void delete(Integer id) {
		bookingRepository.delete(id);
	}

	public boolean isAvaibleComputer(int id, Date starts, Date ends) {

		List<Booking> list = bookingRepository.findBookingComputer(id);
		if (list == null)
			return true;
		else
			return false;
	}

	public boolean isAvaibleRoom(int id, Date starts, Date ends) {
		List<Booking> list = bookingRepository.findBookingRoom(id);
		if (list == null)
			return true;
		else
			return false;
	}
}
