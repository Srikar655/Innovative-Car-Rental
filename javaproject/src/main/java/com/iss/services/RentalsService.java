package com.iss.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.iss.models.*;



public class RentalsService {
	
	EntityManagerFactory	emf;
	EntityManager	em;
	public RentalsService( ) {
		try{
         	emf=Persistence.createEntityManagerFactory("JPA");
     	}catch(Exception	ex)
         {
         		ex.printStackTrace();
         }
	}
	public void add(Rentals renter)
	{
			
			try{
				em=emf.createEntityManager();
				em.getTransaction().begin();
				em.persist(renter);
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
	public List<com.iss.models.Rentals>	getAll()
	{
		try {
				em=emf.createEntityManager();
				TypedQuery<Rentals> query = em.createQuery("SELECT e FROM Rentals e WHERE e.Status NOT LIKE:status", Rentals.class);
				query.setParameter("status","%Cancelled%");
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
	public List<com.iss.models.Rentals>	getTwoDays()
	{
		try {
				em=emf.createEntityManager();
				Query nativeQuery = em.createNativeQuery(
					    "SELECT * FROM Rentals WHERE StartDate BETWEEN GETDATE() AND DATEADD(day, 2, GETDATE()) AND Status NOT LIKE :status",
					    Rentals.class);
					nativeQuery.setParameter("status", "%Cancelled%");
					@SuppressWarnings("unchecked")
					List<Rentals> rentals = nativeQuery.getResultList();
					if(rentals!=null)
					{
						return rentals;
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
	public List<com.iss.models.Rentals>	getTomorrows()
	{
		try {
				em=emf.createEntityManager();
				Query nativeQuery = em.createNativeQuery(
					    "SELECT * FROM Rentals WHERE StartDate >= DATEADD(day, DATEDIFF(day, 0, GETDATE()) + 1, 0) AND StartDate < DATEADD(day, DATEDIFF(day, 0, GETDATE()) + 2, 0) AND Status NOT LIKE :status",
					    Rentals.class);
					nativeQuery.setParameter("status", "%Cancelled%");
					@SuppressWarnings("unchecked")
					List<Rentals> rentals = nativeQuery.getResultList();
					if(rentals!=null)
					{
						return rentals;
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
	public List<com.iss.models.Rentals>	getTodays()
	{
		try {
				em=emf.createEntityManager();
				Query nativeQuery = em.createNativeQuery(
					    "SELECT * FROM Rentals WHERE StartDate >= CAST(GETDATE() AS DATE) AND StartDate < DATEADD(day, 1, CAST(GETDATE() AS DATE)) AND Status NOT LIKE :status",
					    Rentals.class);
					nativeQuery.setParameter("status", "%Cancelled%");
					@SuppressWarnings("unchecked")
					List<Rentals> rentals = nativeQuery.getResultList();
					if(rentals!=null)
					{
						return rentals;
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
	public List<com.iss.models.Rentals>	getSevenDays()
	{
		try {
				em=emf.createEntityManager();
				Query nativeQuery = em.createNativeQuery(
					    "SELECT * FROM Rentals WHERE StartDate >= CAST(GETDATE() AS DATE) AND StartDate < DATEADD(day, 7, CAST(GETDATE() AS DATE)) AND Status NOT LIKE :status",
					    Rentals.class);
					nativeQuery.setParameter("status", "%Cancelled%");
					@SuppressWarnings("unchecked")
					List<Rentals> rentals = nativeQuery.getResultList();
					if(rentals!=null)
					{
						return rentals;
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
	public List<com.iss.models.Rentals>	getThisMonth()
	{
		try {
				em=emf.createEntityManager();
				Query nativeQuery = em.createNativeQuery(
					    "SELECT * FROM Rentals WHERE StartDate >= DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1) AND StartDate < DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()) + 1, 1) AND Status NOT LIKE :status",
					    Rentals.class);
					nativeQuery.setParameter("status", "%Cancelled%");
					@SuppressWarnings("unchecked")
					List<Rentals> rentals = nativeQuery.getResultList();
					if(rentals!=null)
					{
						return rentals;
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
	public List<com.iss.models.Rentals>	getNextMonth()
	{
		try {
				em=emf.createEntityManager();
				Query nativeQuery = em.createNativeQuery(
					    "SELECT * FROM Rentals WHERE StartDate >= DATEFROMPARTS(YEAR(DATEADD(month, 1, GETDATE())), MONTH(DATEADD(month, 1, GETDATE())), 1) AND StartDate < DATEFROMPARTS(YEAR(DATEADD(month, 2, GETDATE())), MONTH(DATEADD(month, 2, GETDATE())), 1) AND Status NOT LIKE :status",
					    Rentals.class);
					nativeQuery.setParameter("status", "%Cancelled%");
					@SuppressWarnings("unchecked")
					List<Rentals> rentals = nativeQuery.getResultList();
					if(rentals!=null)
					{
						return rentals;
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
	@SuppressWarnings("unchecked")
	public List<Rentals> getCancelled(String status)
	{
		try {
			em=emf.createEntityManager();
			Query query = em.createQuery("SELECT e FROM Rentals e WHERE e.Status LIKE :data");
            query.setParameter("data", "%" + status + "%");
            return query.getResultList();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally
		{
			if(em!=null)
				em.close();
		}
		return null;
	}
}
