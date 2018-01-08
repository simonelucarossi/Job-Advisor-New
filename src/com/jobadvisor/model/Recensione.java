package com.jobadvisor.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Recensione {

	private String id;
	private Date data;

	public Recensione() {
	}

	public Recensione(String id, Date d) {
		this.setId(id);
		this.setData(d);
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

		return "Recensione[" + this.getId() + ", " + sdf.format(this.getData()) + "]";
	}

}
