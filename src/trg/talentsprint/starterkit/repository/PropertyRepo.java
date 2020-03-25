package trg.talentsprint.starterkit.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import trg.talentsprint.starterkit.model.Property;

@Repository
public interface PropertyRepo extends CrudRepository<Property, Long> {

	@Query(value = "select * from property where ownername=?1", nativeQuery = true)
	List<Property> myProperty(String user);

	@Query(value = "select * from property where ownername!=?3 and city=?1 or location=?2 ", nativeQuery = true)
	List<Property> searchByCity(String city, String place, String user);

	@Query(value = "select * from property where ownername!=?1", nativeQuery = true)
	List<Property> allProperty(String user);

}
