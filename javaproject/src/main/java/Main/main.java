package Main;

import javax.persistence.*;
import com.iss.models.*;
public class main {
	public static void main(String args[])
	{
			EntityManagerFactory	emf=Persistence.createEntityManagerFactory("JPA");
			EntityManager	em=emf.createEntityManager();
			JpaDemo	jpa=new JpaDemo(em);
			jpa.VehicleTypes();
	}
}
class JpaDemo
{
	private EntityManager	em;
	public JpaDemo(EntityManager em)
	{
		this.em=em;
	}
	public void Countires()
	{
		
	}
	public void States()
	{
		
	}
	public void Cities()
	{
		
	}
	public void VechicleMakes()
	{
		
	}
	public void VehicleModels()
	{
		
	}
	public void VehicleTypes()
	{

	}
	public void VehicleFuel()
	{
		
	}
	public void VehicleCapacity()
	{
		
	}
	public void Owners()
	{
		
	}
	public void EmployeeTypes()
	{
		
	}
	public void Employees()
	{
		
	}
	public void Customers()
	{
		
	}
	public void Drivers()
	{
		
	}
	
}
