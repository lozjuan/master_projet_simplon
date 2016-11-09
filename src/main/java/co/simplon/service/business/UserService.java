package co.simplon.service.business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.simplon.model.User;
import co.simplon.repository.UserRepository;

@Service
public class UserService extends GenericService<User, UserRepository> {

	@Autowired
	public UserRepository userRepository;
	
	public User authenticateUser (String email) {
		User userEmail = userRepository.findByEmail(email);
		return userEmail;
	}
}
