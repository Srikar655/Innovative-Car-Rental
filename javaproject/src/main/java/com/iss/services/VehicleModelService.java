package com.iss.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.iss.models.*;



public class VehicleModelService {
	
	EntityManagerFactory	emf;
	EntityManager	em;
	public VehicleModelService( ) {
		try{
         	emf=Persistence.createEntityManagerFactory("JPA");
     	}catch(Exception	ex)
         {
         		ex.printStackTrace();
         }
	}
	public VehicleModels find(int conid)
	{
		try {
					em=emf.createEntityManager();
					VehicleModels	vm=em.find(VehicleModels.class,conid);
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
	public void add(VehicleModels vm)
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
	public List<com.iss.models.VehicleModels>	getAll()
	{
		try {
				em=emf.createEntityManager();
				TypedQuery<VehicleModels> query = em.createQuery("SELECT e FROM VehicleModels e", VehicleModels.class);
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
			VehicleModels vm=em.find(VehicleModels.class, con);
			if(vm!=null)
			{
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
	public List<VehicleModels> search(String data)
	{
		try {
			
			//Query   query=em.createQuery("Select s from StudentCascade s where s.name like '%a%'");
			
			em=emf.createEntityManager();
			 Query query = em.createQuery("SELECT e FROM VehicleModels e WHERE e.Name LIKE :data");
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
	public void edit(VehicleModels vm)
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
