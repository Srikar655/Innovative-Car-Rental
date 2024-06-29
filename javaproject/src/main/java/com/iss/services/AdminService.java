package com.iss.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.iss.models.*;



public class AdminService {
	
	EntityManagerFactory	emf;
	EntityManager	em;
	public AdminService( ) {
		try{
         	emf=Persistence.createEntityManagerFactory("JPA");
     	}catch(Exception	ex)
         {
         		ex.printStackTrace();
         }
	}
	public boolean checkIsAdmin(String username,String password)
	{
		try {
					em=emf.createEntityManager();
					Query query = em.createQuery("SELECT e FROM Admin e WHERE e.Username  LIKE :username and e.Password  LIKE :password");
		            query.setParameter("username", "%" + username + "%");
		            query.setParameter("password", "%" + password + "%");
		            if(!query.getResultList().isEmpty())
		            {
		            	System.out.println("true");
		            	System.out.println("true");
		            	System.out.println("true");
		            	System.out.println("true");
		            	System.out.println("true");
		            	System.out.println("true");
		            	
		            	return true;
		            }
					
		}catch(Exception ex)
		{
				ex.printStackTrace();
		}finally
		{
				em.close();
		}
		return false;
	}
}
