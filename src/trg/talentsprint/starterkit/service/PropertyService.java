package trg.talentsprint.starterkit.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trg.talentsprint.starterkit.model.Property;
import trg.talentsprint.starterkit.repository.PropertyRepo;

@Service
public class PropertyService {
	@Autowired
	private PropertyRepo repo;

	public List<Property> allProperty() {
		return (List<Property>) repo.findAll();
	}

	public Property save(Property p) {
		return repo.save(p);
	}

	public List<Property> myProperty(String user) {
		return repo.myProperty(user);
	}

	public List<Property> searchByCity(String city, String place, String user) {
		// TODO Auto-generated method stub
		return repo.searchByCity(city, place, user);
	}

	public Optional<Property> findById(Long id) {
		// TODO Auto-generated method stub
		return repo.findById(id);
	}

	public void deleteById(Long id) {
		// TODO Auto-generated method stub
		repo.deleteById(id);
	}

	public List<Property> allPropertyWithoutUser(String user) {
		// TODO Auto-generated method stub
		return repo.allProperty(user);
	}

}
