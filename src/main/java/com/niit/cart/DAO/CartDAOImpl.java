package com.niit.cart.DAO;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.niit.cart.model.Cart;
import com.niit.cart.model.Product;
import com.niit.cart.service.ICartService;


@Repository("CartDAO")
@Transactional

public class CartDAOImpl implements CartDAO
{
	@Autowired
	private SessionFactory sf;

	@Transactional(propagation = Propagation.SUPPORTS)
	public List<Cart> viewAllCart()
	{
		Session s = sf.getCurrentSession();
		Transaction t = s.beginTransaction();
		@SuppressWarnings("unchecked")
		List<Cart> l1 = (List<Cart>) sf.getCurrentSession().createCriteria(Cart.class).list();
		t.commit();
		return l1;
	}
	
	@Transactional(propagation = Propagation.SUPPORTS)
	public void deleteCart(int cartid)
	{
		Session s = sf.getCurrentSession();
		Transaction t = s.beginTransaction();
		Cart c1=(Cart) s.load(Cart.class,cartid);
		System.out.println(c1.getCartid());
        s.delete(c1);
		t.commit();
	}

	public void addCart(Cart cart)
	{
		Session s = sf.getCurrentSession();
		Transaction t = s.beginTransaction();
        s.save(cart);
		t.commit();
	}
}
