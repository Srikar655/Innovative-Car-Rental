package com.iss.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.iss.models.*;



public class VehicleFuelService {
	
	EntityManagerFactory	emf;
	EntityManager	em;
	public VehicleFuelService( ) {
		try{
         	emf=Persistence.createEntityManagerFactory("JPA");
     	}catch(Exception	ex)
         {
         		ex.printStackTrace();
         }
	}
	public void add(EmployeeTypes emp)
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
	public List<com.iss.models.VehicleFuel>	getAll()
	{
		try {
				em=emf.createEntityManager();
				TypedQuery<VehicleFuel> query = em.createQuery("SELECT e FROM VehicleFuel e", VehicleFuel.class);
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