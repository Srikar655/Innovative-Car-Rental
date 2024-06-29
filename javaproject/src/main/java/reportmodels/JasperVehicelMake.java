package reportmodels;

public class JasperVehicelMake {
	
	private String vehiclemake;
	private String model;
	private String color;
	private String vin;
	public JasperVehicelMake(String vehiclemake, String model, String color, String vin) {
		super();
		this.vehiclemake = vehiclemake;
		this.model = model;
		this.color = color;
		this.vin = vin;
	}
	public JasperVehicelMake() {
		super();
	}
	public String getVehiclemake() {
		return vehiclemake;
	}
	public void setVehiclemake(String vehiclemake) {
		this.vehiclemake = vehiclemake;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getVin() {
		return vin;
	}
	public void setVin(String vin) {
		this.vin = vin;
	}
	

}
