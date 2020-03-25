package trg.talentsprint.starterkit.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import trg.talentsprint.starterkit.model.Payment;

@Repository
public interface PaymentRepo extends CrudRepository<Payment, Integer> {

	@Modifying
	@Transactional
	@Query(value = "insert into payment(amountpaid,cardtype,user,date,name) values (?1,?2,?3,?4,?5)", nativeQuery = true)
	void paymentsave(int amount, String type, String user, String date, String name);

	@Query(value = "select * from payment where user=?1", nativeQuery = true)
	List<Payment> myPayment(String user);

}
