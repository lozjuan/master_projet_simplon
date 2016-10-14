package co.simplon.repository;

import javax.annotation.Resource;

import org.springframework.data.jpa.repository.JpaRepository;

import co.simplon.model.Computer;

@Resource
public interface ComputerRepository extends JpaRepository<Computer, Integer> {
}
