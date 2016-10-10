package com.niit.cart.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.niit.cart.model.Category;
import com.niit.cart.model.Supplier;

@Repository("SupplierDAO")
public class SupplierDAOImpl implements SupplierDAO 
{
	@Autowired
	private SessionFactory sf;
	
   @Transactional(propagation=Propagation.SUPPORTS)
	public void addSupplier(Supplier s)
   {
	   System.out.println("supp");
		Session s1=sf.getCurrentSession();
		Transaction t=s1.beginTransaction();
		System.out.println("adding supplier");
		s1.saveOrUpdate(s);
		t.commit();
	}

   @Transactional(propagation = Propagation.SUPPORTS)
public List<Supplier> viewAllSupplier() {
	// TODO Auto-generated method stub
	{
		Session s = sf.getCurrentSession();
		Transaction t = s.beginTransaction();
		List<Supplier> l1 = (List<Supplier>) sf.getCurrentSession().createCriteria(Supplier.class).list();
		t.commit();
		return l1;
	}
}
   @Transactional(propagation = Propagation.SUPPORTS)
public void deleteSupplier(int sid) {
	// TODO Auto-generated method stub
	Session s = sf.getCurrentSession();
	Transaction t = s.beginTransaction();
    Supplier s1=(Supplier) s.load(Supplier.class,sid);
    s.delete(s1);
	t.commit();
}

   @Transactional(propagation = Propagation.SUPPORTS)
public void updateSupplier(Supplier s) {
	// TODO Auto-generated method stub
	Session s1 = sf.openSession();
	Transaction t = s1.beginTransaction();
	System.out.println(s.getSname());
	System.out.println(s.getSaddress());
	System.out.println(s.getSid());
	s1.update(s);
	t.commit();
}

   @Transactional(propagation = Propagation.SUPPORTS)
public Supplier editSupplier(int sid) {
	// TODO Auto-generated method stub
	Session s = sf.getCurrentSession();
	Transaction t = s.beginTransaction();
	Supplier s1=(Supplier)s.get(Supplier.class,sid);
	System.out.println(s1.getSid());
	t.commit();
	return s1;
}
}
