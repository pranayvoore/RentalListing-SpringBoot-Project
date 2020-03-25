package trg.talentsprint.starterkit.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Property {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String location;
	private String ownername;
	private String type;
	private int sqyards;
	private String pname;
	private String city;
	private int price;
	private String imagepath;

	public Property() {
		super();
	}

	public Property(Long id, String location, String ownername, String type, int sqyards, String pname, String city,
			int price, String imagepath) {
		super();
		this.id = id;
		this.location = location;
		this.ownername = ownername;
		this.type = type;
		this.sqyards = sqyards;
		this.pname = pname;
		this.city = city;
		this.price = price;
		this.imagepath = imagepath;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getOwnername() {
		return ownername;
	}

	public void setOwnername(String ownername) {
		this.ownername = ownername;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getSqyards() {
		return sqyards;
	}

	public void setSqyards(int sqyards) {
		this.sqyards = sqyards;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getImagepath() {
		return imagepath;
	}

	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}

}
