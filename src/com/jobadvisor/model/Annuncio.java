package com.jobadvisor.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Annuncio {

	private String id;
	private String categoria;
	private Date data;
	private Double latitudine;
	private Double longitudine;

	public Annuncio(String id, String cat, Date d ,Double lat,Double lon) {
		this.id = id;
		this.categoria = cat;
		this.data = d;
		this.latitudine=lat;
		this.longitudine=lon;
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
		return "Annuncio[" + this.getId() + ", " + this.getCategoria() + ", " + sdf.format(this.getData()) + this.getLatitudine()+", "+ this.getLongitudine()+"]";
	}

	public Double getLatitudine() {
		return latitudine;
	}

	public void setLatitudine(Double latitudine) {
		this.latitudine = latitudine;
	}

	public Double getLongitudine() {
		return longitudine;
	}

	public void setLongitudine(Double longitudine) {
		this.longitudine = longitudine;
	}
}
