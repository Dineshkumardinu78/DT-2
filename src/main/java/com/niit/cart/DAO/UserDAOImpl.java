
package com.niit.cart.DAO;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.niit.cart.DAO.UserDAO;
import com.niit.cart.model.UserRole;
import com.niit.cart.model.User;

@Repository("UserDAO")
public class UserDAOImpl implements UserDAO 
{
	User user;

	@Autowired
	private SessionFactory sf;

	@Transactional(propagation = Propagation.SUPPORTS)
	public void addUser(User u)
	{
		Session s = sf.getCurrentSession();
		Transaction t = s.beginTransaction();
		System.out.println("new user");
		s.saveOrUpdate(u);
		UserRole r=new UserRole();
		System.out.println("userid");
		r.setUser_role_id(u.getUid());
		System.out.println("roleuserid");
		r.setAuthority("ROLE_USER");
		s.saveOrUpdate(r);
		t.commit();
		/*Session s1 = sf.openSession();
		Transaction t1 = s1.beginTransaction();*/
		//t.commit();
		//
		//t1.commit();
	}
	
	public User verify(User u)
	{
		Session s = sf.getCurrentSession();
		Transaction t = s.beginTransaction();
		Criteria c=s.createCriteria(User.class);
		System.out.println(u.getMail());
		System.out.println(u.getPwd());
		c.add(Restrictions.eq("mail",u.getMail()));
		c.add(Restrictions.eq("pwd",u.getPwd()));
		user=(User) c.uniqueResult();
		System.out.println(user.getFirstname());
		t.commit();
		return user;
	}

	public User getUser()
	{
		return user;
	}
	
	@Transactional(propagation = Propagation.SUPPORTS)
	public User editUser(int uid)
	{
		Session s = sf.getCurrentSession();
		Transaction t = s.beginTransaction();
		user=(User)s.get(User.class,uid);
		System.out.println(user.getUid());
		t.commit();
		return user;
	}
}
