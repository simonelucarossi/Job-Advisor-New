package com.jobadvisor.persistence.dao;

import java.util.List;

import com.jobadvisor.model.Recensione;

public interface RecensioneDao {
	public void save(Recensione recensione); // Create

	public Recensione findByPrimaryKey(Long id); // Retrieve

	public List<Recensione> findAll();

	public void update(Recensione recensione); // Update

	public void delete(Recensione recensione); // Delete
}
