package com.niit.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.niit.cart.DAO.SupplierDAO;
import com.niit.cart.model.Supplier;

@Service("SupplierService")
public class SupplierService implements ISupplierService
{
	@Autowired(required=true)
	public SupplierDAO sd;

	public void addSupplier(Supplier s) {
		// TODO Auto-generated method stub
		sd.addSupplier(s);
		
	}

	public List<Supplier> viewAllSupplier() {
		// TODO Auto-generated method stub
		return sd.viewAllSupplier();
	}

	public void deleteSupplier(int sid) {
		// TODO Auto-generated method stub
		sd.deleteSupplier(sid);
	}

	public void updateSupplier(Supplier s) {
		// TODO Auto-generated method stub
		sd.updateSupplier(s);
	}

	public Supplier editSupplier(int sid) {
		// TODO Auto-generated method stub
		
		 return sd.editSupplier(sid);
		
	}
	
	

}
