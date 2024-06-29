package com.iss.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.iss.models.*;



public class CitiesService {
	
	EntityManagerFactory	emf;
	EntityManager	em;
	public CitiesService( ) {
		try{
         	emf=Persistence.createEntityManagerFactory("JPA");
     	}catch(Exception	ex)
         {
         		ex.printStackTrace();
         }
	}
	public Cities find(int conid)
	{
		try {
					em=emf.createEntityManager();
					Cities	city=em.find(Cities.class,conid);
					if(city!=null)
					{
						return city;
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
	public void add(Cities city)
	{
			
			try{
				em=emf.createEntityManager();
				em.getTransaction().begin();
				em.persist(city);
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
	public List<com.iss.models.Cities>	getAll()
	{
		try {
				em=emf.createEntityManager();
				TypedQuery<Cities> query = em.createQuery("SELECT e FROM Cities e", Cities.class);
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
			Cities city=em.find(Cities.class, con);
			if(city!=null)
			{
				em.getTransaction().begin();
				em.remove(city);
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
	public List<Cities> search(String data)
	{
		try {
			
			//Query   query=em.createQuery("Select s from StudentCascade s where s.name like '%a%'");
			
			em=emf.createEntityManager();
			 Query query = em.createQuery("SELECT e FROM Cities e WHERE e.CityName LIKE :data");
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
	public void edit(Cities city)
	{
		try {
					em=emf.createEntityManager();
						em.getTransaction().begin();
							em.merge(city);
						em.getTransaction().commit();
		}catch(Exception ex)
		{
				ex.printStackTrace();
		}finally
		{
				em.close();
		}
	}
	public List<Cities> find(String conid)
	{
		try {
					em=emf.createEntityManager();
					 Query query = em.createQuery("SELECT e FROM States e WHERE e.StateNo LIKE :data");
			            query.setParameter("data", "%" + Integer.parseInt(conid) + "%");
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
}
