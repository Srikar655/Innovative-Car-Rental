package com.iss.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.iss.models.*;



public class EmployeesService {
	
	EntityManagerFactory	emf;
	EntityManager	em;
	public EmployeesService( ) {
		try{
         	emf=Persistence.createEntityManagerFactory("JPA");
     	}catch(Exception	ex)
         {
         		ex.printStackTrace();
         }
	}
	public void add(Employees emp)
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
	public void destroy()
	{
		if(emf.isOpen())
		{
			emf.close();
		}
	}
	public List<com.iss.models.Employees>	getAll()
	{
		try {
				em=emf.createEntityManager();
				TypedQuery<Employees> query = em.createQuery("SELECT e FROM Employees e", Employees.class);
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
			Employees emp=em.find(Employees.class, con);
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
	public List<Employees> search(String data)
	{
		try {
			
			//Query   query=em.createQuery("Select s from StudentCascade s where s.name like '%a%'");
			
			em=emf.createEntityManager();
			 Query query = em.createQuery("SELECT e FROM Employees e WHERE e.Name LIKE :data");
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
	public void edit(Employees emp)
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
	public Employees find(int conid)
	{
		try {
					em=emf.createEntityManager();
					Employees	emp=em.find(Employees.class,conid);
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
}
