package trg.talentsprint.starterkit.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import trg.talentsprint.starterkit.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
	User findByUsername(String username);

	@Modifying
	@Transactional
	@Query(value = "update user set email=?1,phonenum=?2,address=?3,imagepath=?5 where username=?4	", nativeQuery = true)
	void updateUser(String email, Long phonenum, String address, String user, String imagepath);
}
