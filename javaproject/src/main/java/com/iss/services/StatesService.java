package com.iss.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.iss.models.*;



public class StatesService {
	
	EntityManagerFactory	emf;
	EntityManager	em;
	public StatesService( ) {
		try{
         	emf=Persistence.createEntityManagerFactory("JPA");
     	}catch(Exception	ex)
         {
         		ex.printStackTrace();
         }
	}
	public void add(States state)
	{
			
			try{
				em=emf.createEntityManager();	
				em.getTransaction().begin();
				em.persist(state);
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
	public List<com.iss.models.States>	getAll()
	{
		try {
				em=emf.createEntityManager();
				TypedQuery<States> query = em.createQuery("SELECT e FROM States e", States.class);
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
			States state=em.find(States.class, con);
			if(state!=null)
			{
				em.getTransaction().begin();
				em.remove(state);
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
	public List<States> search(String data)
	{
		try {
			
			//Query   query=em.createQuery("Select s from StudentCascade s where s.name like '%a%'");
			
			em=emf.createEntityManager();
			 Query query = em.createQuery("SELECT e FROM States e WHERE e.StateName LIKE :data");
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
	public void edit(States state)
	{
		try {
					em=emf.createEntityManager();
						em.getTransaction().begin();
							em.merge(state);
						em.getTransaction().commit();
		}catch(Exception ex)
		{
				ex.printStackTrace();
		}finally
		{
				em.close();
		}
	}
	public States find(int conid)
	{
		try {
					em=emf.createEntityManager();
					States	state=em.find(States.class,conid);
					if(state!=null)
					{
						return state;
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
	public List<States> find(String conid)
	{
		try {
					em=emf.createEntityManager();
					 Query query = em.createQuery("SELECT e FROM States e WHERE e.CountryNo LIKE :data");
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
