package co.simplon.repository;


import javax.annotation.Resource;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import co.simplon.model.User;

@Resource
public interface UserRepository extends JpaRepository<User, Integer> {

	@Query ("select u from User u where u.email=?1")
	public User findByEmail(String email);

	@Query ("select u from User u where u.id=?1")
	public  User findUserById(Integer id);

}
