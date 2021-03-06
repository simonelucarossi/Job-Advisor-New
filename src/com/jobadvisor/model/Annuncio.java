package com.jobadvisor.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Annuncio {

	private Long id;
	private String categoria;
	private Date data;
	private String descrizione;
	private Double prezzo;
	private Double latitudine;
	private Double longitudine;
	private Utente creatore;

	public Annuncio(String cat, Date d,String descr,Double prezzo,Double lat,Double lon,Utente creatore) {
		this.categoria = cat;
		this.data = d;
		this.descrizione=descr;
		this.prezzo=prezzo;
		this.latitudine=lat;
		this.longitudine=lon;
		this.creatore=creatore;
	}

	public Annuncio() {
	}

	public Annuncio(String category, String description, Double price) {
		this.categoria=category;
		this.descrizione=description;
		this.prezzo=price;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
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
	
	public Utente getCreator() { return this.creatore; }
	
	public void setCreator(Utente creator) { 
		this.creatore = creator;
	}

	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		return "Annuncio["+ this.getCategoria() + ", "+this.getDescrizione()+", "+ sdf.format(this.getData()) +", "+this.getPrezzo()+", "+ this.getLatitudine()+", "+ this.getLongitudine()+"]";
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

	public Double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(Double prezzo) {
		this.prezzo = prezzo;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}


}
