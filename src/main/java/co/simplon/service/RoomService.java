package co.simplon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.simplon.model.Room;
import co.simplon.repository.RoomRepository;

@Repository
public class RoomService {

	@Autowired
	public RoomRepository roomRepository;

	public List<Room> getAll() {
		return roomRepository.findAll();
	}

	public Room findById(Integer id) {
		return roomRepository.findOne(id);
	}

	public Room addOrUpdate(Room room) {
		return roomRepository.save(room);
	}

	public void delete(Integer id) {
		roomRepository.delete(id);
	}

}
