package com.jobadvisor.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Recensione {

	private Long id;
	private Date data;
	private String creatore;
	private String titolo;
	private String testo;
	private Long annuncio;
	private String valutazione;

	public Recensione() {
	}

	public Recensione(Long id, Date d, String titolo, String testo,String creatore, Long idAds, String valutazione) {
		this.id=id;
		this.data=d;
		this.creatore = creatore;
		this.titolo = titolo;
		this.testo = testo;
		this.annuncio = idAds;
		this.valutazione = valutazione;
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
	
	

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getTesto() {
		return testo;
	}

	public void setTesto(String testo) {
		this.testo = testo;
	}

	public Long getAnnuncio() {
		return annuncio;
	}

	public void setAnnuncio(Long annuncio) {
		this.annuncio = annuncio;
	}

	public String getValutazione() {
		return valutazione;
	}

	public void setValutazione(String valutazione) {
		this.valutazione = valutazione;
	}
	
	

}
