package com.niit.cart.service;

import com.niit.cart.model.User;

public interface IUserService 
{
	void addUser(User u);
    User verify(User u);
	public User getUser();
}
