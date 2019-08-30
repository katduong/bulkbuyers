package com.codingdojo.warehouse.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.warehouse.models.Category;
import com.codingdojo.warehouse.models.Orderproduct;
import com.codingdojo.warehouse.models.Product;
import com.codingdojo.warehouse.models.User;
import com.codingdojo.warehouse.services.MainService;

@Controller
public class MainController {
	private final MainService mainService;

	public MainController(MainService mainService) {
		this.mainService = mainService;
	}
	
	@RequestMapping("/home")
	public String homePage(Model model, HttpSession session, @ModelAttribute("u") User u) {
		if (session.getAttribute("id") != null) {
			User user = mainService.findUserById((Long) session.getAttribute("id"));
			List<Orderproduct> cart = user.getCart();
			session.setAttribute("cart", cart);
		}
		else if (session.getAttribute("cart") == null) {
			List<Orderproduct> cart = new ArrayList<Orderproduct>();
			session.setAttribute("cart", cart);
		}
		return "homePage.jsp";
	}
	
	@PostMapping("/{path}/register")
	public String registerUser(@PathVariable("path") String path,@Valid @ModelAttribute("u") User user, BindingResult result, HttpSession session) {
		if (result.hasErrors()) {
			return "homePage.jsp";
		}
		else {
			User newUser = mainService.registerUser(user);
			session.setAttribute("id", newUser.getId());
			session.setAttribute("user", newUser);
			return "redirect:/"+path;
		}
	}
	
	@PostMapping("/{path}/login")
	public String loginUser(@PathVariable("path") String path, @RequestParam("email") String email, @RequestParam("password") String password, HttpSession session, RedirectAttributes redirectAttributes) {
		if (mainService.authenticateUser(email, password)) {
			User user = mainService.findByEmail(email);
			session.setAttribute("id", user.getId());
			session.setAttribute("user", user);
			return "redirect:/" + path;
		}
		else {
			redirectAttributes.addFlashAttribute("error", "User could not be authenticated, please try again.");
    		return "redirect:/";
		}
	}
	
	@RequestMapping("/category/{id}")
	public String showCategoryProduct(@PathVariable("id") Long id, Model model, HttpSession session, @ModelAttribute("user") User u) {
		List<Orderproduct> cart = (List<Orderproduct>) session.getAttribute("cart");
		for (Orderproduct p : cart) {
			System.out.println(p.getProduct().getName());
		}
		List<Category> categories = mainService.findAllCategories();
		Category category = mainService.findCategoryById(id);
		model.addAttribute("category", category);
		model.addAttribute("categories", categories);
		for (Category cat : categories) {
			System.out.println(cat.getName());
		}
//		Product product = mainService.findProductById(Integer.toUnsignedLong(1));
//		category.getProducts().add(product);
//		mainService.createCategory(category);
		return "shoppingPage.jsp";
	}
	
	@RequestMapping("/products/{id}")
	public String showProduct(@PathVariable("id") Long id, Model model, @ModelAttribute("orderProduct") Orderproduct orderProduct, @ModelAttribute("user") User u) {
		Product product = mainService.findProductById(id);
		model.addAttribute("product", product);
		return "product.jsp";
	}
	
	@RequestMapping("/cart")
	public String showCart(Model model, HttpSession session) {
		return "cart.jsp";
	}
	
	@PostMapping("/addCart")
	public String addCart(@ModelAttribute("orderProduct") Orderproduct orderProduct, HttpSession session, @ModelAttribute("user") User u) {
		List<Orderproduct> cart = (List<Orderproduct>) session.getAttribute("cart");
		cart.add(orderProduct);
		session.setAttribute("cart", cart);
		return "redirect:/category/"+ orderProduct.getProduct().getCategory().getId();
		
	}
}
