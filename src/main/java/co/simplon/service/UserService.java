package co.simplon.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.simplon.model.User;
import co.simplon.repository.UserRepository;

@Service
public class UserService extends GenericService<User, UserRepository> {

	@Autowired
	public UserRepository userRepository;

}
