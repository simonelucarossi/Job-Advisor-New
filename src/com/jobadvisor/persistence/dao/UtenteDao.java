package com.jobadvisor.persistence.dao;

import java.util.Date;
import java.util.List;

import com.jobadvisor.model.Utente;
import com.jobadvisor.persistence.UtenteCredenziali;

public interface UtenteDao {

	public void save(Utente Utente); // Create

	public Utente findByPrimaryKey(String username); // Retrieve

	public List<Utente> findAll();

	public void update(Utente Utente); // Update

	public void delete(Utente Utente); // Delete

	public void setPassword(Utente Utente, String password);

	public UtenteCredenziali findByPrimaryKeyCredential(String username);

	public void setBan(Utente utente, Date date);

	public List<Utente> findAllByBan();
}
