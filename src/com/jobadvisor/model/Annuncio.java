package com.jobadvisor.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Annuncio {

	private String id;
	private String categoria;
	private Date data;

	public Annuncio(String id, String cat, Date d) {
		this.id = id;
		this.categoria = cat;
		this.data = d;
	}

	public Annuncio() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

		return "Annuncio[" + this.getId() + ", " + this.getCategoria() + ", " + sdf.format(this.getData()) + "]";
	}
}
