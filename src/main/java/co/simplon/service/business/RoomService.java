package co.simplon.service.business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.simplon.model.Room;
import co.simplon.repository.RoomRepository;

@Service
public class RoomService extends GenericService<Room, RoomRepository> {

	@Autowired
	public RoomRepository roomRepository;

}
