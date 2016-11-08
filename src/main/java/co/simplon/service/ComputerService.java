package co.simplon.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.simplon.model.Computer;
import co.simplon.repository.ComputerRepository;

@Service
public class ComputerService extends GenericService< Computer, ComputerRepository > {

	@Autowired
	public ComputerRepository computerRepository;

}
