package com.iss.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.iss.models.*;



public class DriverDetailsService {
	
	EntityManagerFactory	emf;
	EntityManager	em;
	public DriverDetailsService( ) {
		try{
         	emf=Persistence.createEntityManagerFactory("JPA");
     	}catch(Exception	ex)
         {
         		ex.printStackTrace();
         }
	}
	public void add(Drivers driver)
	{
			
			try{
				em=emf.createEntityManager();
				em.getTransaction().begin();
				em.persist(driver);
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
	public List<com.iss.models.Drivers>	getAll()
	{
		try {
				em=emf.createEntityManager();
				TypedQuery<Drivers> query = em.createQuery("SELECT e FROM Drivers e", Drivers.class);
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
			Drivers driver=em.find(Drivers.class, con);
			if(driver!=null)
			{
				em.getTransaction().begin();
				em.remove(driver);
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
	public List<Drivers> search(String data)
	{
		try {
			
			//Query   query=em.createQuery("Select s from StudentCascade s where s.name like '%a%'");
			
			em=emf.createEntityManager();
			 Query query = em.createQuery("SELECT e FROM Drivers e WHERE e.Name LIKE :data");
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
	public void edit(Drivers driver)
	{
		try {
					em=emf.createEntityManager();
						em.getTransaction().begin();
						em.merge(driver);
						em.getTransaction().commit();			
		}catch(Exception ex)
		{
				ex.printStackTrace();
		}finally
		{
				em.close();
		}
	}
	public Drivers find(int conid)
	{
		try {
					em=emf.createEntityManager();
					Drivers	driver=em.find(Drivers.class,conid);
					if(driver!=null)
					{
						return driver;
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
}
