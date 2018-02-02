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
	private Date fineBan;
	private String tipo;
	private String email;
	private String telefono;
	private String password;
	private Set<Annuncio> annunci;
	private Set<Recensione> recensioniScritte;

	public Utente(String u, String n, String c, String s, Date dn, String t,String em,String tel) {
		this.username = u;
		this.nome = n;
		this.cognome = c;
		this.sesso = s;
		this.dataNascita = dn;
		this.tipo = t;
		this.email=em;
		this.telefono=tel;
		annunci = new HashSet<>();
		recensioniScritte = new HashSet<>();
	}

	public Utente() {
		annunci = new HashSet<>();
		recensioniScritte = new HashSet<>();
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
	
	public String getNomeCompleto() { return (this.nome + " " + this.cognome); }

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

	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

		return "Utente[" + this.getUsername() + ", " + this.getNome() + ", " + this.getCognome() + ", "
				+ this.getSesso() + ", " + sdf.format(this.getDataNascita()) + ", " + this.getTipo() 
				+ ", " + this.getEmail() + ", " + this.getTelefono()+"]";
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public Date getFineBan() {
		return fineBan;
	}

	public void setFineBan(Date fineBan) {
		this.fineBan = fineBan;
	}
}
