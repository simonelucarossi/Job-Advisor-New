package com.jobadvisor.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Recensione {

	private Long id;
	private Date data;
	private String creatore;
	private Long annuncio;

	public Recensione() {
	}

	public Recensione(Long id, Date d) {
		this.id=id;
		this.data=d;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
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

		return "Recensione[" + this.getId() + ", " + sdf.format(this.getData()) + ", "+this.getCreatore()+", "+this.getAnnuncio()+"]";
	}

	public String getCreatore() {
		return creatore;
	}

	public void setCreatore(String creatore) {
		this.creatore = creatore;
	}

	public Long getAnnuncio() {
		return annuncio;
	}

	public void setAnnuncio(Long annuncio) {
		this.annuncio = annuncio;
	}

}
