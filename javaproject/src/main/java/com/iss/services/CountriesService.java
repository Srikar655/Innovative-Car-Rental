package com.iss.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.iss.models.*;



public class CountriesService {
	
	EntityManagerFactory	emf;
	EntityManager	em;
	public CountriesService( ) {
		try{
         	emf=Persistence.createEntityManagerFactory("JPA");
     	}catch(Exception	ex)
         {
         		ex.printStackTrace();
         }
	}
	public Countries find(int conid)
	{
		try {
					em=emf.createEntityManager();
					Countries	country=em.find(Countries.class,conid);
					if(country!=null)
					{
						return country;
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
	public void add(com.iss.models.Countries emp)
	{
			
			try{
				em=emf.createEntityManager();	
				em.getTransaction().begin();
				em.persist(emp);
				em.getTransaction().commit();
				em.close();
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
	public List<com.iss.models.Countries>	getAll()
	{
		try {
				em=emf.createEntityManager();
				TypedQuery<Countries> query = em.createQuery("SELECT e FROM Countries e", Countries.class);
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
			Countries country=em.find(Countries.class, con);
			if(country!=null)
			{
				em.getTransaction().begin();
				em.remove(country);
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
	public List<Countries> search(String data)
	{
		try {
			
			//Query   query=em.createQuery("Select s from StudentCascade s where s.name like '%a%'");
			
			em=emf.createEntityManager();
			 Query query = em.createQuery("SELECT e FROM Countries e WHERE e.Country LIKE :data");
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
	public void edit(Countries country)
	{
		try {
					em=emf.createEntityManager();
						em.getTransaction().begin();
							em.merge(country);
						em.getTransaction().commit();
		}catch(Exception ex)
		{
				ex.printStackTrace();
		}finally
		{
				em.close();
		}
	}
}
