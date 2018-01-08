package com.jobadvisor.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Utente {

	private String username;
	private String nome;
	private String cognome;
	private String sesso;
	private Date dataNascita;
	private String tipo;
	private String password;
	private Set<Annuncio> annunci;
	private Set<Recensione> recensioniScritte;
	private Set<Recensione> recensioniRelative;

	public Utente(String u, String n, String c, String s, Date dn, String t) {
		this.username = u;
		this.nome = n;
		this.cognome = c;
		this.sesso = s;
		this.dataNascita = dn;
		this.tipo = t;
		annunci = new HashSet<>();
		recensioniScritte = new HashSet<>();
		recensioniRelative = new HashSet<>();
	}

	public Utente() {
		annunci = new HashSet<>();
		recensioniScritte = new HashSet<>();
		recensioniRelative = new HashSet<>();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getSesso() {
		return sesso;
	}

	public void setSesso(String sesso) {
		this.sesso = sesso;
	}

	public Date getDataNascita() {
		return dataNascita;
	}

	public void setDataNascita(Date dataNascita) {
		this.dataNascita = dataNascita;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public Set<Annuncio> getAnnunci() {
		return annunci;
	}

	public void setAnnunci(Set<Annuncio> annunci) {
		this.annunci = annunci;
	}

	public Set<Recensione> getRecensioniScritte() {
		return recensioniScritte;
	}

	public void setRecensioniScritte(Set<Recensione> recensioniScritte) {
		this.recensioniScritte = recensioniScritte;
	}

	public Set<Recensione> getRecensioniRelative() {
		return recensioniRelative;
	}

	public void setRecensioniRelative(Set<Recensione> recensioniRelative) {
		this.recensioniRelative = recensioniRelative;
	}

	public void addAnnuncio(Annuncio a) {
		getAnnunci().add(a);
	}

	public void removeAnnuncio(Annuncio a) {
		getAnnunci().remove(a);
	}

	public void addRecensioneScritta(Recensione r) {
		getRecensioniScritte().add(r);
	}

	public void removeRecensioneScritta(Recensione r) {
		getRecensioniScritte().remove(r);
	}

	public void addRecensioneRelativa(Recensione r) {
		getRecensioniRelative().add(r);
	}

	public void removeRecensioneRelativa(Recensione r) {
		getRecensioniRelative().remove(r);
	}

	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

		return "Utente[" + this.getUsername() + ", " + this.getNome() + ", " + this.getCognome() + ", "
				+ this.getSesso() + ", " + sdf.format(this.getDataNascita()) + ", " + this.getTipo() + "]";
	}
}
