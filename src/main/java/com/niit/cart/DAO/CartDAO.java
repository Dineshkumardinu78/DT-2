package com.niit.cart.DAO;

import java.util.List;

import com.niit.cart.model.Cart;
import com.niit.cart.model.Product;

public interface CartDAO 
	{
		public List<Cart> viewAllCart();
		public void deleteCart(int cid);
		public void addCart(Cart cart);
    }
	
