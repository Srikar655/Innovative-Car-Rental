package com.iss.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.iss.models.*;



public class CustomerService {
	
	EntityManagerFactory	emf;
	EntityManager	em;
	public CustomerService( ) {
		try{
         	emf=Persistence.createEntityManagerFactory("JPA");
     	}catch(Exception	ex)
         {
         		ex.printStackTrace();
         }
	}
	public void add(Customers emp)
	{
			
			try{
				em=emf.createEntityManager();
				em.getTransaction().begin();
				em.persist(emp);
				em.getTransaction().commit();
			}catch(Exception Ex)
			{
				Ex.printStackTrace();
			}finally
			{
				em.close();
			}
	}
	public void add(Rentals renter)
	{
			
			try{
				em=emf.createEntityManager();
				em.getTransaction().begin();
				em.persist(renter);
				em.getTransaction().commit();
			}catch(Exception Ex)
			{
				Ex.printStackTrace();
			}finally
			{
				em.close();
			}
	}
	public void destroy()
	{
		if(emf.isOpen())
		{
			emf.close();
		}
	}
	public List<com.iss.models.Customers>	getAll()
	{
		try {
				em=emf.createEntityManager();
				TypedQuery<Customers> query = em.createQuery("SELECT e FROM Customers e", Customers.class);
		        return query.getResultList();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally
		{
			em.close();
		}
		return null;
	}
	public void delete(int con)
	{
		try {
			em=emf.createEntityManager();
			Customers emp=em.find(Customers.class, con);
			if(emp!=null)
			{
				em.getTransaction().begin();
				em.remove(emp);
				em.getTransaction().commit();
			}
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally
		{
			if(em!=null)
				em.close();
		}
	}
	@SuppressWarnings("unchecked")
	public List<Customers> search(String data)
	{
		try {
			
			//Query   query=em.createQuery("Select s from StudentCascade s where s.name like '%a%'");
			
			em=emf.createEntityManager();
			 Query query = em.createQuery("SELECT e FROM Customers e WHERE e.Name LIKE :data");
	            query.setParameter("data", "%" + data + "%");
	        return query.getResultList();
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}finally
			{
				em.close();
			}
			return null;
	}
	public Customers find(String data)
	{
		try {
			
			//Query   query=em.createQuery("Select s from StudentCascade s where s.name like '%a%'");
			
			em=emf.createEntityManager();
			 Query query = em.createQuery("SELECT e FROM Customers e WHERE e.Username LIKE :data");
	            query.setParameter("data", "%" + data + "%");
	        return (Customers) query.getSingleResult();
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}finally
			{
				em.close();
			}
			return null;
	}
	public void edit(Customers emp)
	{
		try {
					em=emf.createEntityManager();
						em.getTransaction().begin();
						em.merge(emp);
						em.getTransaction().commit();
		}catch(Exception ex)
		{
				ex.printStackTrace();
		}finally
		{
				em.close();
		}
	}
	public void edit(Rentals emp)
	{
		try {
					em=emf.createEntityManager();
						em.getTransaction().begin();
						em.merge(emp);
						em.getTransaction().commit();
		}catch(Exception ex)
		{
				ex.printStackTrace();
		}finally
		{
				em.close();
		}
	}
	public Customers find(int conid)
	{
		try {
					em=emf.createEntityManager();
					Customers	emp=em.find(Customers.class,conid);
					if(emp!=null)
					{
						return emp;
					}
					
		}catch(Exception ex)
		{
				ex.printStackTrace();
		}finally
		{
				em.close();
		}
		return null;
	}
	public Rentals findRental(int conid)
	{
		try {
					em=emf.createEntityManager();
					Rentals	emp=em.find(Rentals.class,conid);
					if(emp!=null)
					{
						return emp;
					}
					
		}catch(Exception ex)
		{
				ex.printStackTrace();
		}finally
		{
				em.close();
		}
		return null;
	}
	public Customers checkIsThere(String username,String password)
	{
		try {
					em=emf.createEntityManager();
					Query query = em.createQuery("SELECT e FROM Customers e WHERE e.Username  LIKE :username and e.Password  LIKE :password");
		            query.setParameter("username", "%" + username + "%");
		            query.setParameter("password", "%" + password + "%");
		            if(!query.getResultList().isEmpty())
		            {
		            	return (Customers) query.getResultStream().findFirst().orElse(null);
		            }
					
		}catch(Exception ex)
		{
				ex.printStackTrace();
		}finally
		{
				em.close();
		}
		return null;
	}
	public String pay(String accountnumber,String amount)
	{
		try {
					em=emf.createEntityManager();
					Query query1 = em.createQuery("SELECT e FROM BankAccounts e WHERE e.accountnumber  LIKE :accountnumber");
		            query1.setParameter("accountnumber", "%" + accountnumber + "%");
		            BankAccounts debitaraccount=(BankAccounts)query1.getSingleResult();
		            query1.setParameter("accountnumber", "%" + "InnovativeSolutions" + "%");
		            BankAccounts creditoraccount=(BankAccounts)query1.getSingleResult();
		            if(debitaraccount!=null)
		            {
		            	if(debitaraccount.getAmount()>=Double.parseDouble(amount))
		            	{
		            		creditoraccount.setAmount(creditoraccount.getAmount()+Double.parseDouble(amount));
		            		debitaraccount.setAmount(debitaraccount.getAmount()-Double.parseDouble(amount));
		            		em.getTransaction().begin();
		            		em.merge(debitaraccount);
		            		em.merge(creditoraccount);
		            		em.getTransaction().commit();
		            		return "Transaction Successfull";
		            	}
		            	else
		            	{
		            		return "Insufficient Funds";
		            	}
		            }
					
		}catch(Exception ex)
		{
				ex.printStackTrace();
		}finally
		{
				em.close();
		}
		return "Enter Valid Details";
	}
}
