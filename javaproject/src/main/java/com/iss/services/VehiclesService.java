package com.iss.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.iss.models.*;



public class VehiclesService {
	
	EntityManagerFactory	emf;
	EntityManager	em;
	public VehiclesService( ) {
		try{
         	emf=Persistence.createEntityManagerFactory("JPA");
     	}catch(Exception	ex)
         {
         		ex.printStackTrace();
         }
	}
	public void add(Vehicles	vehicle)
	{
			
			try{
				em=emf.createEntityManager();
				em.getTransaction().begin();
				em.persist(vehicle);
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
	public List<com.iss.models.Vehicles>	getAll()
	{
		try {
				em=emf.createEntityManager();
				TypedQuery<Vehicles> query = em.createQuery("SELECT e FROM Vehicles e", Vehicles.class);
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
			Vehicles vehicles=em.find(Vehicles.class, con);
			if(vehicles!=null)
			{
				em.getTransaction().begin();
				em.remove(vehicles);
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
	public List<Vehicles> search(String data)
	{
		try {
			
			//Query   query=em.createQuery("Select s from StudentCascade s where s.name like '%a%'");
			
			em=emf.createEntityManager();
			 Query query = em.createQuery("SELECT e FROM Vehicles e WHERE e.Name LIKE :data");
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
	@SuppressWarnings("unchecked")
	public List<Vehicles> find(String data)
	{
		try {
			
			em=emf.createEntityManager();
			 Query query = em.createQuery("SELECT e FROM Vehicles e WHERE e.Type LIKE :data");
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
	@SuppressWarnings("unchecked")
	public List<Vehicles> findByMake(String data)
	{
		try {
			
			em=emf.createEntityManager();
			 Query query = em.createQuery("SELECT e FROM Vehicles e WHERE e.vehiclemodels.vehiclemakes.Name LIKE :data");
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
	public void edit(Vehicles	vehicle)
	{
		try {
					em=emf.createEntityManager();
						em.getTransaction().begin();
							em.merge(vehicle);
						em.getTransaction().commit();
		}catch(Exception ex)
		{
				ex.printStackTrace();
		}finally
		{
				em.close();
		}
	}
	public Vehicles find(int conid)
	{
		try {
					em=emf.createEntityManager();
					Vehicles	owner=em.find(Vehicles.class,conid);
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
