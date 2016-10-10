package com.niit.cart.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.cart.model.Category;
import com.niit.cart.model.Supplier;
import com.niit.cart.model.User;
import com.niit.cart.service.ISupplierService;
import com.niit.cart.util.Util;

@Controller
public class SupplierController 
{
	 @Autowired(required=true)
	 ISupplierService iSupplierService;
	 
	 int tcid=0;
	 Supplier sup;
		@RequestMapping(value = { "addsupplier" })
		public ModelAndView addSupplier( @ModelAttribute("cart") Supplier c,BindingResult result) 
		{
			System.out.println("addsupplier");
			System.out.println("added");
			return new ModelAndView("addsupplier", "command", new Supplier()).addObject("supplier",iSupplierService.viewAllSupplier()).addObject("stat", "Update Supplier");
		}			
		
		@RequestMapping(value = { "storeSupplier" })
		public ModelAndView storeSupplier(HttpServletRequest request, @ModelAttribute("cart") Supplier s, BindingResult result)
		{
			System.out.println("Store Supplier");
			iSupplierService.addSupplier(s);
			String name=Util.removeComma(s.getSname());
			s.setSname(name);
			ModelAndView mv=new ModelAndView("addsupplier");
			if(result.hasErrors())
			{
				mv=new ModelAndView("addsupplier", "command", new Supplier()).addObject("supplier", iSupplierService.viewAllSupplier());
						mv.addObject("errors", result.getAllErrors());
						for(ObjectError S:result.getAllErrors())
						{
							System.out.println(S);
						}
			}
			return new ModelAndView("addsupplier", "command", new Supplier()).addObject("supplier", iSupplierService.viewAllSupplier());
		}
		
		@RequestMapping(value = { "/supplier/storeSupplier" })
		public ModelAndView updateSupplier(HttpServletRequest request, @ModelAttribute("cart") Supplier s, BindingResult result) 
		{
			System.out.println("Store Supplier");
			sup.setSname(s.getSname().substring(s.getSname().lastIndexOf(',')+1));
			iSupplierService.updateSupplier(sup);
			return new ModelAndView("addsupplier", "command", new Supplier()).addObject("addsupplier", iSupplierService.viewAllSupplier());
		}
		
		@RequestMapping(value = { "supplier/delete" })
		public ModelAndView delete(HttpServletRequest request)
		{
			String Sid=request.getParameter("s");
			iSupplierService.deleteSupplier(Integer.parseInt(Sid));
			System.out.println("Delete supplier");
			return new ModelAndView("addsupplier", "command", new Supplier()).addObject("addsupplier",iSupplierService.viewAllSupplier());
		}
		
		@RequestMapping(value = { "/supplier/edit" })
		public ModelAndView edit(HttpServletRequest request) 
		{
			System.out.println("Edit Supplier");
			String Sid=request.getParameter("s");
			sup=iSupplierService.editSupplier(Integer.parseInt(Sid));
			System.out.println(tcid);
			return new ModelAndView("addsupplier", "command", iSupplierService.editSupplier(Integer.parseInt(Sid))).addObject("Supplier",iSupplierService.viewAllSupplier()).addObject("stat", "Edit Product");
		}
	}

