package co.simplon.repository;

import javax.annotation.Resource;

import org.springframework.data.jpa.repository.JpaRepository;
import co.simplon.model.User;

@Resource
public interface UserRepository extends JpaRepository<User, Integer> {
}
