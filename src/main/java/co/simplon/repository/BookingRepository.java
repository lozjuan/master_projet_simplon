package co.simplon.repository;

import javax.annotation.Resource;

import org.springframework.data.jpa.repository.JpaRepository;

import co.simplon.model.Booking;


@Resource
public interface BookingRepository extends JpaRepository<Booking, Integer> {

}
