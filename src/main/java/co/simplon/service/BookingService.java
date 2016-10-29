package co.simplon.service;

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
}
