package co.simplon.repository;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import co.simplon.model.Booking;

@Resource
public interface BookingRepository extends JpaRepository<Booking, Integer> {

	@Query("select id from Booking where computerId=?1")
	public List<Booking> findBookingComputer(Integer computerId);

	@Query("select id from Booking where roomId=?1")
	public List<Booking> findBookingRoom(Integer salleId);

}
