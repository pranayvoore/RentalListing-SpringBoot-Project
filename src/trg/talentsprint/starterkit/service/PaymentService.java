package trg.talentsprint.starterkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trg.talentsprint.starterkit.model.Payment;
import trg.talentsprint.starterkit.repository.PaymentRepo;

@Service
public class PaymentService {
	@Autowired
	private PaymentRepo repo;

	public void paymentsave(int amount, String type, String user, String date, String name) {
		// TODO Auto-generated method stub
		repo.paymentsave(amount, type, user, date, name);
	}

	public List<Payment> myPayment(String user) {
		// TODO Auto-generated method stub
		return repo.myPayment(user);
	}

}
