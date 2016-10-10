package com.niit.cart.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.cart.model.Cart;
import com.niit.cart.model.Product;
import com.niit.cart.service.ICartService;
import com.niit.cart.service.IProductService;
import com.niit.cart.service.IUserService;

@Controller
public class CartController {
	                             
	@Autowired(required=true)
	ICartService iCartService;
	
	@Autowired(required=true)
	IProductService iProductService;
	
	@Autowired(required=true)
	IUserService iUserService;
	
	@RequestMapping(value = { "cart" })
	public ModelAndView cart() {
		System.out.println("Cart1");
		return new ModelAndView("cart").addObject("cart",iCartService.viewAllCart());
	}
	
	@RequestMapping(value = { "viewcart" })
	public ModelAndView viewcart(HttpServletRequest request, @ModelAttribute("cart") Product p,BindingResult result) {
		System.out.println("View Cart");
		return new ModelAndView("cart").addObject("cart",iCartService.viewAllCart());
	}
	
	@RequestMapping(value = { "/storecart" })
	public ModelAndView addcart(HttpServletRequest request, @ModelAttribute("cart") Product p,BindingResult result) {
		System.out.println("Store Cart");
		String pid = request.getParameter("p");
		Cart c=new Cart();
		c.setProduct(iProductService.editProduct(Integer.parseInt(pid)));
		c.setQuantity(1);
		System.out.print("adding to cart "+iUserService.getUser());
		c.setUser(iUserService.getUser());
		iCartService.addToCart(c);
		return new ModelAndView("cart", "cartItem",c).addObject("cart",iCartService.viewAllCart());
	}
	
	@RequestMapping(value = { "cart/delete" })
	public String delete(HttpServletRequest request) 
	{
		System.out.println("del");
		String cartid = request.getParameter("p");
		System.out.println("dels");
		iCartService.deleteCart(Integer.parseInt(cartid));
		System.out.println("Delete Product");
		iCartService.viewAllCart();
		return "redirect:/cart";
		//return new ModelAndView("cart", "command", new Cart()).addObject("cart",iCartService.viewAllCart());
	}
	
	@RequestMapping(value = { "cart/check" })
	public ModelAndView check(HttpServletRequest request)
	{
		String cartid = request.getParameter("p");
		iCartService.deleteCart(Integer.parseInt(cartid));
		System.out.println("Check Product");
		return new ModelAndView("buy");
	}
	
	@RequestMapping(value = { "cart/continue" })
	public ModelAndView cont(HttpServletRequest request) 
	{
		System.out.println("Continue");
		return new ModelAndView("index").addObject("continue",true);
	}
}