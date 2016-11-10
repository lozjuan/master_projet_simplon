package co.simplon.service.authentication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import co.simplon.model.User;
import co.simplon.repository.UserRepository;

@Service
public class AuthService implements UserDetailsService {

	@Autowired
    private UserRepository userRepository;

    @Override
    @Transactional(readOnly=true)
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        User user = userRepository.findByEmail(username);
        if(user==null) {
            throw new UsernameNotFoundException("User name not found");
        }
        return user;
    }


}
