package com.niit.cart.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.cart.model.Cart;
import com.niit.cart.model.Category;
import com.niit.cart.model.Product;
import com.niit.cart.model.User;
import com.niit.cart.service.ICartService;
import com.niit.cart.service.ICategoryService;
import com.niit.cart.service.IProductService;
import com.niit.cart.service.ISupplierService;
import com.niit.cart.util.Util;

@Controller
public class ProductController 
{
	@Autowired(required = true)
	IProductService iProductService;

	@Autowired(required = true)
	ICategoryService iCategoryService;

	@Autowired(required = true)
	ICartService iCartService;
	
	@Autowired(required = true)
	ISupplierService iSupplierService;
	
	int tpid = 0;

	@RequestMapping(value = { "/addproduct" })
	public ModelAndView addProduct()
	{
		System.out.println("add Product");
		System.out.println("prod");
		return new ModelAndView("addproduct", "command", new Product()).addObject("products", iProductService.viewAllProducts()).addObject("Category",iCategoryService.viewAllCategory()).addObject("supplier",iSupplierService.viewAllSupplier()).addObject("stat", "Add Product");
	}

	@RequestMapping(value = { "storeproduct" })
	public ModelAndView storeProduct(HttpServletRequest request, @RequestParam("image") MultipartFile file,ModelMap model, @ModelAttribute("cart") Product p,BindingResult result) 
	{	
		System.out.println("dinesh");
		int cid=Integer.parseInt(request.getParameter("category"));
		int sid=Integer.parseInt(request.getParameter("supplier"));
		System.out.println("Store Product "+cid);
		p.setCategory(iCategoryService.editCategory(cid));
		p.setSupplier(iSupplierService.editSupplier(sid));
		String name=Util.removeComma(p.getPname());
		p.setPname(name);
		for(ObjectError o:result.getAllErrors())
		{
			iProductService.addProduct(p);
			String fileName = null,error="";
	    	if (!file.isEmpty()) 
	    	{
	            try
	            {
	                fileName = file.getOriginalFilename();
	                System.out.println(fileName);
	                byte[] bytes = file.getBytes();
	                BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(new File("D:\\workspace\\cart\\src\\main\\webapp\\resources\\images\\" + fileName)));
	                buffStream.write(bytes);
	                buffStream.close();
	                error= "You have successfully uploaded " + fileName;
	            }
	            catch (Exception e) 
	            {
	            	error="You failed to upload " + fileName + ": " + e.getMessage();
	            }
	        } 
	    	else
	    	{
	        	error="Unable to upload. File is empty.";
	        }
	    	File oldName = new File("D:\\workspace\\cart\\src\\main\\webapp\\resources\\images\\" + fileName);
	        File newName = new File("D:\\workspace\\cart\\src\\main\\webapp\\resources\\images\\" + p.getPname()+fileName.substring(fileName.indexOf(".")));
	        System.out.println(p.getPid());
	        if(oldName.renameTo(newName))
	        {
	           error=p.getPname()+" Profile Upload Successfully !";
	        }
		//iProductService.addProduct(p);
		}
		return new ModelAndView("addproduct", "command", new Product()).addObject("products", iProductService.viewAllProducts()).addObject("Category",iCategoryService.viewAllCategory()).addObject("supplier",iSupplierService.viewAllSupplier()).addObject("stat", "Add Product");
	}
	
	@RequestMapping(value = { "/Product/storeproduct" })
	public ModelAndView updateProduct(HttpServletRequest request, @ModelAttribute("cart") Product p,BindingResult result) 
	{
		System.out.println("Store Product");
		p.setPid(tpid);
		iProductService.updateProduct(p);
		return new ModelAndView("addproduct", "command", new Product()).addObject("addproduct", iProductService.viewAllProducts());
	}

	@RequestMapping(value = { "Product/delete" })
	public String delete(HttpServletRequest request) 
	{
		String pid = request.getParameter("p");
		iProductService.deleteProduct(Integer.parseInt(pid));
		System.out.println("Delete Product");
		//return new ModelAndView("addproduct", "command", new Product()).addObject("products",iProductService.viewAllProducts());
return "redirect:/addproduct";	
	}

	@RequestMapping(value = { "/Product/edit" })
	public ModelAndView edit(HttpServletRequest request) 
	{
		System.out.println("Edit Product");
		String pid = request.getParameter("p");
		tpid = iProductService.editProduct(Integer.parseInt(pid)).getPid();
		System.out.println(tpid);
		return new ModelAndView("addproduct", "command", iProductService.editProduct(Integer.parseInt(pid))).addObject("products", iProductService.viewAllProducts()).addObject("Category",iCategoryService.viewAllCategory()).addObject("stat", "Edit Product");
	}
	
	
	@RequestMapping(value = { "products" })
	public ModelAndView women(HttpServletRequest request) 
	{
		int cid=Integer.parseInt(request.getParameter("c"));
		Category c=iCategoryService.editCategory(cid);
		System.out.println("category "+cid);
		return new ModelAndView("products").addObject("products", iProductService.viewAllProducts(c));
	}

	@RequestMapping(value = { "proddetails" })
	public ModelAndView proddetails(HttpServletRequest request,Product p) 
	{
		System.out.println("proddetails");
		String pid = request.getParameter("p");
		return new ModelAndView("proddetails","p",iProductService.editProduct(Integer.parseInt(pid))).addObject("product",p);
	}
	
	@RequestMapping(value = { "Product/cart" })
	public ModelAndView cart(HttpServletRequest request)
	{
		String pid = request.getParameter("p");
		System.out.println("cart");
		return new ModelAndView("cart","p",iProductService.editProduct(Integer.parseInt(pid))).addObject("cart",iCartService.viewAllCart()).addObject("products",iProductService.viewAllProducts());
	}
}