package co.simplon.repository;

import javax.annotation.Resource;

import org.springframework.data.jpa.repository.JpaRepository;

import co.simplon.model.Room;

@Resource
public interface RoomRepository extends JpaRepository<Room, Integer>{	
}
