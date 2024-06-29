package com.iss.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.iss.models.*;



public class VehicleMakesService {
	
	private static final EntityManager VehicleMakes = null;
	EntityManagerFactory	emf;
	EntityManager	em;
	public VehicleMakesService( ) {
		try{
         	emf=Persistence.createEntityManagerFactory("JPA");
     	}catch(Exception	ex)
         {
         		ex.printStackTrace();
         }
	}
	public VehicleMakes find(int conid)
	{
		try {
					em=emf.createEntityManager();
					VehicleMakes	vm=em.find(VehicleMakes.class,conid);
					if(vm!=null)
					{
						return vm;
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
	public void add(VehicleMakes vm)
	{
			
			try{
				em=emf.createEntityManager();
				em.getTransaction().begin();
				em.persist(vm);
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
	public List<com.iss.models.VehicleMakes>	getAll()
	{
		try {
				em=emf.createEntityManager();
				TypedQuery<VehicleMakes> query = em.createQuery("SELECT e FROM VehicleMakes e", VehicleMakes.class);
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
			VehicleMakes vm=em.find(VehicleMakes.class, con);
			System.out.print(con);
			if(vm!=null)
			{
				System.out.print(true);
				em.getTransaction().begin();
				em.remove(vm);
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
	public List<VehicleMakes> search(String data)
	{
		try {
			
			//Query   query=em.createQuery("Select s from StudentCascade s where s.name like '%a%'");
			
			em=emf.createEntityManager();
			 Query query = em.createQuery("SELECT e FROM VehicleMakes e WHERE e.Name LIKE :data");
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
	public void edit(VehicleMakes vm)
	{
		try {
					em=emf.createEntityManager();
						em.getTransaction().begin();
							em.merge(vm);
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
