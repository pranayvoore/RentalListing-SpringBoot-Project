package trg.talentsprint.starterkit.web;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import trg.talentsprint.starterkit.model.Property;
import trg.talentsprint.starterkit.model.Payment;
import trg.talentsprint.starterkit.model.Request;
import trg.talentsprint.starterkit.model.User;
import trg.talentsprint.starterkit.service.PaymentService;
import trg.talentsprint.starterkit.service.PropertyService;
import trg.talentsprint.starterkit.service.RequestService;
import trg.talentsprint.starterkit.service.UserService;

@Controller
public class RentalController {
	@Autowired
	private PropertyService service;
	@Autowired
	private RequestService rservice;
	@Autowired
	private UserService uservice;
	@Autowired
	private PaymentService pservice;
	@Value("${upload.location}")
	private String uploadDirectory;

	@GetMapping("/tenorlan/{user}")
	public String tenorlan(@RequestParam("ten") String name, Model model, @PathVariable("user") String user) {
		if (name.equalsIgnoreCase("Select Option")) {
			return "welcome";
		} else if (name.equalsIgnoreCase("tenant")) {
			model.addAttribute("plist", service.allPropertyWithoutUser(user));
			return "tenant";
		}
		model.addAttribute("plist", service.myProperty(user));
		return "landlord";
	}

	@GetMapping("/viewprop")
	public String showAllProperty(Model model) {
		model.addAttribute("list", service.allProperty());
		return "viewpro";
	}

	@GetMapping("/new-prop")
	public String showProperties(Model model) {
		model.addAttribute("property", new Property());
		return "newprop";
	}

	@PostMapping(value = "/add/{user}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public String addNewProperty(@Valid @ModelAttribute Property p, BindingResult result, Model model,
			@PathVariable("user") String user, @RequestParam("file") MultipartFile[] files) {
		if (result.hasErrors()) {
			return "newprop";
		}
		StringBuilder fileNames = new StringBuilder();
		for (MultipartFile file : files) {
			Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
			fileNames.append(file.getOriginalFilename() + " ");
			try {
				Files.write(fileNameAndPath, file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String path = fileNames.toString();
		p.setImagepath(path);
		service.save(p);
		model.addAttribute("plist", service.myProperty(user));
		return "userpro";
	}

	@GetMapping("/propByuser/{user}")
	public String propbyUser(@PathVariable("user") String user, Model model) {
		model.addAttribute("plist", service.myProperty(user));
		return "userpro";

	}

	@GetMapping("/{id}")
	public String showBookdById(@PathVariable Long id, Model model) {
		Property prop = service.findById(id)
				.orElseThrow(() -> new IllegalArgumentException("Invalid Property Id:" + id));
		model.addAttribute("plist", prop);
		return "editdetails";
	}

	@PostMapping("/{id}/update/{user}")
	public String updateBook(@PathVariable Long id, @Valid @ModelAttribute Property p, BindingResult result,
			Model model, @PathVariable("user") String user, @RequestParam("file") MultipartFile[] files) {
		if (result.hasErrors()) {
			return "editdetails";
		}
		StringBuilder fileNames = new StringBuilder();
		for (MultipartFile file : files) {
			Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
			fileNames.append(file.getOriginalFilename() + " ");
			try {
				Files.write(fileNameAndPath, file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String path = fileNames.toString();
		p.setImagepath(path);
		service.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid Poperty Id:" + id));
		service.save(p);
		model.addAttribute("plist", service.myProperty(user));
		return "userpro";
	}

	@GetMapping("/searchbycity/{user}")
	public String searchbycity(@RequestParam("city") String city, @RequestParam("place") String place, Model model,
			@PathVariable("user") String user) {
		if (city.equals("") && place.equals("")) {
			model.addAttribute("plist", service.allPropertyWithoutUser(user));
			return "tenant";
		}
		model.addAttribute("plist", service.searchByCity(city, place, user));
		return "tenant";
	}

	@GetMapping("/{id}/delete/{user}")
	public String deleteBook(@PathVariable Long id, Model model, @PathVariable("user") String user) {
		service.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid book Id:" + id));
		service.deleteById(id);
		System.out.println(id);
		model.addAttribute("plist", service.myProperty(user));
		return "userpro";
	}

	@GetMapping("/{id}/getProp")
	public String getPropDetails(@PathVariable Long id, Model model) {
		Property prop = service.findById(id)
				.orElseThrow(() -> new IllegalArgumentException("Invalid Property Id:" + id));
		model.addAttribute("plist", prop);
		return "propdetails";
	}

	@GetMapping("/{id}/request/{user}")
	public String requestToLandlord(@PathVariable Long id, Model model, @PathVariable("user") String user) {
		List<Request> ulist = new ArrayList<Request>();
		ulist = rservice.getRequests(id);
		System.out.println(ulist);

		for (Request s : ulist) {
			if (s.getUsername().equals(user)) {
				return "alreadyadded";
			}
		}

		Request r1 = new Request(id, user);
		rservice.save(r1);
		return "tenant";
	}

	@GetMapping("/{id}/showrequests")
	public String showrequests(@PathVariable Long id, Model model) {
		rservice.getRequests(id);
		model.addAttribute("plist", rservice.getRequests(id));
		return "req";
	}

	@GetMapping("/{id}/showprofile/{user}")
	public String showProfile(@PathVariable Long id, Model model, @PathVariable("user") String user) {
		User u = uservice.findByUsername(user);
		model.addAttribute("details", u);
		return "profileff";
	}

	@GetMapping("/showprofile/{user}")
	public String showProfileU(@PathVariable("user") String user, Model model) {
		User u = uservice.findByUsername(user);
		model.addAttribute("details", u);
		return "profileff";
	}

	@GetMapping("/{id}/{user}/accept")
	public String AcceptDecline(@PathVariable("id") Long id, Model model, @PathVariable("user") String user) {
		Request r = rservice.findByIdandUser(id, user);
		r.setStatus("Accepted");
		rservice.save(r);
		model.addAttribute("plist", rservice.getRequests(id));
		return "req";
	}

	@GetMapping("/{id}/{user}/decline")
	public String DeclineStatus(@PathVariable("id") Long id, Model model, @PathVariable("user") String user) {
		Request r = rservice.findByIdandUser(id, user);
		r.setStatus("Delcined");
		rservice.save(r);
		model.addAttribute("plist", rservice.getRequests(id));
		return "req";
	}

	@GetMapping("/requestedprop/{user}")
	public String RequestedProp(@PathVariable("user") String user, Model model) {
		List<Long> pidlist = new ArrayList<Long>();
		pidlist = rservice.findpid(user);
		List<Property> plist = new ArrayList<Property>();
		List<Request> rlist = new ArrayList<Request>();
		for (Long l : pidlist) {
			Property p = service.findById(l).orElseThrow(() -> new IllegalArgumentException("Invalid book Id:" + l));
			plist.add(p);
		}
		for (Long l : pidlist) {
			rlist = rservice.getRequests(l);
		}
		System.out.println(rlist);
		model.addAttribute("rlist", rlist);
		model.addAttribute("plist", plist);
		return "requestprop";
	}

	@GetMapping("/requestedprop/showstatus/{user}/{id}")
	public String ShowStatus(@PathVariable("user") String user, Model model, @PathVariable("id") Long id) {
		Property plist = service.findById(id)
				.orElseThrow(() -> new IllegalArgumentException("Invalid Property Id:" + id));
		String status = rservice.findStatus(user, id);
		model.addAttribute("plist", plist);
		model.addAttribute("status", status);
		return "status";
	}

	@GetMapping("/payment")
	public String Payment(Model model) {
		// model.addAttribute("payment", new Payment());
		return "payment";
	}

	@GetMapping("/addpayment/{user}")
	public String addNewPayment(@RequestParam("amount") int amount, @RequestParam("type") String type,
			@RequestParam("date") String date, Model model, @PathVariable("user") String user,
			@RequestParam("name") String name) {
		pservice.paymentsave(amount, type, user, date, name);

		model.addAttribute("plist", pservice.myPayment(user));
		return "payhis";
	}

	@GetMapping("/paymenthistory/{user}")
	public String showPaymentHis(@PathVariable("user") String user, Model model) {
		model.addAttribute("plist", pservice.myPayment(user));
		return "payhis";
	}

	/*
	 * @RequestMapping(value = "/upl", method = RequestMethod.POST) public String
	 * upload1(Model model, @RequestParam("file") MultipartFile[] files, Property p)
	 * {
	 * 
	 * StringBuilder fileNames = new StringBuilder(); for (MultipartFile file :
	 * files) { Path fileNameAndPath = Paths.get(uploadDirectory,
	 * file.getOriginalFilename()); fileNames.append(file.getOriginalFilename() +
	 * " "); try { Files.write(fileNameAndPath, file.getBytes()); } catch
	 * (IOException e) { e.printStackTrace(); } } String path =
	 * fileNames.toString(); p.setImagepath(path); service.save(p); return
	 * "welcome"; }
	 */
}
