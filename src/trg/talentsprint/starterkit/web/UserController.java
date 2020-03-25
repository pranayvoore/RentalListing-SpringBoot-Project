package trg.talentsprint.starterkit.web;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

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
import trg.talentsprint.starterkit.model.User;
import trg.talentsprint.starterkit.service.SecurityService;
import trg.talentsprint.starterkit.service.UserService;
import trg.talentsprint.starterkit.validator.UserValidator;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	private SecurityService securityService;

	@Autowired
	private UserValidator userValidator;

	@GetMapping("/registration")
	public String registration(Model model) {
		model.addAttribute("userForm", new User());

		return "registration";
	}

	@PostMapping(value = "/registration", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model,
			@RequestParam("file") MultipartFile[] files) {
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
		userForm.setImagepath(path);

		userValidator.validate(userForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "registration";
		}

		userService.save(userForm);

		securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());

		return "redirect:/welcome";
	}

	@GetMapping("/login")
	public String login(Model model, String error, String logout) {
		if (error != null)
			model.addAttribute("error", "Your username and password is invalid.");

		if (logout != null)
			model.addAttribute("message", "You have been logged out successfully.");

		return "login";
	}

	@GetMapping({ "/", "/welcome" })
	public String welcome(Model model) {
		return "welcome";
	}

	@GetMapping("/userprofilell/{user}")
	public String userdetails(@PathVariable("user") String user, Model model) {
		model.addAttribute("details", userService.findByUsername(user));
		return "profile";
	}

	@GetMapping("/userprofilett/{user}")
	public String userdetailst(@PathVariable("user") String user, Model model) {
		model.addAttribute("details", userService.findByUsername(user));
		return "profiletenant";
	}

	/*
	 * @GetMapping("/editprofile/{user}") public String showBookdById(@PathVariable
	 * String user, Model model) { User u = userService.findByUsername(user);
	 * model.addAttribute("user", u); return "editprofile"; }
	 * 
	 * @PostMapping("/updateuser/{user}") public String
	 * updateUser(@PathVariable("user") String user, @RequestParam("email") String
	 * email,
	 * 
	 * @RequestParam("phonenum") Long phonenum, @RequestParam("address") String
	 * address, Model model) { userService.updateDetails(email, phonenum, address,
	 * user); model.addAttribute("details", userService.findByUsername(user));
	 * return "profile"; }
	 */

	@GetMapping("/editprofilet/{user}")
	public String showTenantdById(@PathVariable String user, Model model) {
		User u = userService.findByUsername(user);
		model.addAttribute("user", u);
		return "editprofilet";
	}

	@Value("${upload.location}")
	private String uploadDirectory;

	@PostMapping("/updateusert/{user}")
	public String updateTenant(@PathVariable("user") String user, @RequestParam("email") String email,
			@RequestParam("phonenum") Long phonenum, @RequestParam("address") String address, Model model,
			@RequestParam("file") MultipartFile[] files) {
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
		System.out.println(path);
		userService.updateDetails(email, phonenum, address, user, path);
		model.addAttribute("details", userService.findByUsername(user));
		return "profiletenant";
	}

}
