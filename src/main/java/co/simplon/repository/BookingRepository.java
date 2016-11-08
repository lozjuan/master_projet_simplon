package co.simplon.repository;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import co.simplon.model.Booking;

@Resource
public interface BookingRepository extends JpaRepository<Booking, Integer> {

	@Query("select id from Booking where computerId=?1 and not(?2>=ends or starts>=?3)")
	public List<Booking> findBookingComputer(Integer computerId,Date dateDebut,Date dateFin);


	@Query("select id from Booking where roomId=?1 and not(?2>=ends or starts>=?3)")
	public List<Booking> findBookingRoom(Integer salleId,Date dateDebut, Date dateFin);

}
