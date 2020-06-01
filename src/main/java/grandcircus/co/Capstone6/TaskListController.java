package grandcircus.co.Capstone6;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class TaskListController {

	@Autowired
	private UserRepository userRepo;
	@Autowired
	private TaskRepository taskRepo;
	@Autowired
	private HttpSession session;

	@RequestMapping("/")
	public String welcomeOrLogin() {
		if (session.getAttribute("user") != null) {
			return "welcome";
		} else {
			return "login";
		}
	}

	@RequestMapping("/login/submit")
	public String submitLoginForm(@RequestParam("email") String email, @RequestParam("password") String password,
			Model model) {

		Optional<User> foundUser = userRepo.findByEmailAndPassword(email, password);
		if (foundUser.isPresent()) {
			session.setAttribute("user", foundUser.get());
			return "redirect:/";
		} else {
			model.addAttribute("message", "Incorrect email or password.");
			return "login";
		}
	}

	@RequestMapping("/my-tasks")
	public String taskList(Model model) {
		if (session.getAttribute("user") != null) {
			User user = (User) session.getAttribute("user");
			model.addAttribute("tasks", taskRepo.findByUserId(user.getId()));
			return "task-list";
		} else {
			model.addAttribute("message", "Not logged in");
			return "login";
		}
		
	}

	@RequestMapping("/add-task")
	public String showAddTaskForm(Model model) {
		model.addAttribute("title","Add a task");
		return "add-task";
	}

	@PostMapping("/add-task")
	public String submitAddTaskForm(Task task) {
		User user = (User) session.getAttribute("user");

		user = userRepo.findById(user.getId()).get();

		task.setUser(user);
		taskRepo.save(task);
		

		return "redirect:/my-tasks";
	}
	
	@RequestMapping("/task/update")
	public String showEditForm(@RequestParam(value="id",required=false) Long id, Model model) {
		
		// findById returns an Optional<Type>
		// we must give a default value (if no instance is found)
		Task task = taskRepo.findById(id).orElse(null);
		
		model.addAttribute("task", task);
		model.addAttribute("title","Edit a task");
		return "add-task";
	}
	
	@PostMapping("/task/update")
	public String submitEditTaskForm(Task task) {
		User user = (User) session.getAttribute("user");

		user = userRepo.findById(user.getId()).get();

		task.setUser(user);
		taskRepo.save(task);

		return "redirect:/my-tasks";
	}
	
	@RequestMapping("/task/delete/{id}")
	public String removeFood(@PathVariable("id") Long id) {
		
		taskRepo.deleteById(id);
		
		return "redirect:/my-tasks";
	}
	
	@RequestMapping("/logout")
	public String logout(RedirectAttributes redir, Model model) {
		if (session.getAttribute("user") != null) {
			redir.addFlashAttribute("message","Logged out successfully");
			
			session.invalidate();
			return "redirect:/";
		} else {
			model.addAttribute("message", "Not logged in");
			return "login";
		}
	}
	@RequestMapping("/signup")
	public String signUpForm() {
		
		return "signup-form";
	}
	
	
	@RequestMapping("/signup/submit")
	public String signUpSubmit(User user) {
				
		userRepo.save(user);
		
		return "redirect:/";
	}

}
