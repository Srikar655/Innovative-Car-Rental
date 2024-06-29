package com.iss.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.iss.models.*;



public class EmployeeTypesService {
	
	EntityManagerFactory	emf;
	EntityManager	em;
	public EmployeeTypesService( ) {
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
	public List<com.iss.models.EmployeeTypes>	getAll()
	{
		try {
				em=emf.createEntityManager();
				TypedQuery<EmployeeTypes> query = em.createQuery("SELECT e FROM EmployeeTypes e", EmployeeTypes.class);
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