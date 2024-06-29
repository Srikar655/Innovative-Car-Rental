package com.iss.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.iss.models.*;



public class OwnersService {
	
	EntityManagerFactory	emf;
	EntityManager	em;
	public OwnersService( ) {
		try{
         	emf=Persistence.createEntityManagerFactory("JPA");
     	}catch(Exception	ex)
         {
         		ex.printStackTrace();
         }
	}
	public void add(Owners	owner)
	{
			
			try{
				em=emf.createEntityManager();
				em.getTransaction().begin();
				em.persist(owner);
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
	public List<com.iss.models.Owners>	getAll()
	{
		try {
				em=emf.createEntityManager();
				TypedQuery<Owners> query = em.createQuery("SELECT e FROM Owners e", Owners.class);
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
			Owners owner=em.find(Owners.class, con);
			if(owner!=null)
			{
				em.getTransaction().begin();
				em.remove(owner);
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
	public List<Owners> search(String data)
	{
		try {
			
			//Query   query=em.createQuery("Select s from StudentCascade s where s.name like '%a%'");
			
			em=emf.createEntityManager();
			 Query query = em.createQuery("SELECT e FROM Owners e WHERE e.Name LIKE :data");
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
	public void edit(Owners	owner)
	{
		try {
					em=emf.createEntityManager();
						em.getTransaction().begin();
							em.merge(owner);
						em.getTransaction().commit();
		}catch(Exception ex)
		{
				ex.printStackTrace();
		}finally
		{
				em.close();
		}
	}
	public Owners find(int conid)
	{
		try {
					em=emf.createEntityManager();
					Owners	owner=em.find(Owners.class,conid);
					if(owner!=null)
					{
						return owner;
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
