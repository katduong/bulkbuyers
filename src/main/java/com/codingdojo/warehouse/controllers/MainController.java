package com.codingdojo.warehouse.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.warehouse.models.Category;
import com.codingdojo.warehouse.models.Product;
import com.codingdojo.warehouse.services.MainService;

@Controller
public class MainController {
	private final MainService mainService;

	public MainController(MainService mainService) {
		this.mainService = mainService;
	}
	
	@RequestMapping("/home")
	public String homePage(Model model) {
		return "homePage.jsp";
	}
	
	@RequestMapping("/category/{id}")
	public String showCategoryProduct(@PathVariable("id") Long id, Model model) {
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
	
	@RequestMapping("/cart")
	public String showCart(Model model, HttpSession session) {
		return "cart.jsp";
	}
}
