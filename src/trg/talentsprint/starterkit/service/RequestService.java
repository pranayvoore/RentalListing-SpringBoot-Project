package trg.talentsprint.starterkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trg.talentsprint.starterkit.model.Request;
import trg.talentsprint.starterkit.repository.RequestRepo;

@Service
public class RequestService {
	@Autowired
	private RequestRepo repo;

	public void save(Request r) {
		repo.save(r);

	}

	public List<Request> getRequests(Long id) {
		// TODO Auto-generated method stub
		return repo.getRequests(id);
	}

	public void statusupdate(Long id, String user, String status) {
		// TODO Auto-generated method stub
		repo.updateStatus(id, user, status);
	}

	public Request findByIdandUser(Long id, String user) {
		// TODO Auto-generated method stub
		return repo.findByIdandUser(id, user);
	}

	public List<Long> findpid(String user) {
		// TODO Auto-generated method stub
		return repo.findpid(user);
	}

	public String findStatus(String user, Long id) {
		// TODO Auto-generated method stub
		return repo.findStatus(user, id);
	}

}
