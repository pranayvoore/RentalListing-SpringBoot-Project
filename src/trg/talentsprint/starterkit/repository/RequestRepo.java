package trg.talentsprint.starterkit.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import trg.talentsprint.starterkit.model.Request;

@Repository
public interface RequestRepo extends CrudRepository<Request, Long> {
	@Query(value = "select * from request where pid=?1", nativeQuery = true)
	List<Request> getRequests(Long id);

	@Query(value = "update request set status=?3 where pid=?1 and username=?2", nativeQuery = true)
	void updateStatus(Long id, String user, String status);

	@Query(value = "select * from request where pid=?1 and username=?2", nativeQuery = true)
	Request findByIdandUser(Long id, String user);

	@Query(value = "select pid from request where username=?1", nativeQuery = true)
	List<Long> findpid(String user);

	@Query(value = "select status from request where username=?1 and pid=?2", nativeQuery = true)
	String findStatus(String user, Long id);

}
