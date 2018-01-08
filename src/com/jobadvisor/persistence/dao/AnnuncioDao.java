package com.jobadvisor.persistence.dao;

import java.util.List;

import com.jobadvisor.model.Annuncio;

public interface AnnuncioDao {
	public void save(Annuncio annuncio); // Create

	public Annuncio findByPrimaryKey(String id); // Retrieve

	public List<Annuncio> findAll();

	public void update(Annuncio annuncio); // Update

	public void delete(Annuncio annuncio); // Delete

}
