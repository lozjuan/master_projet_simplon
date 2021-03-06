package co.simplon.service.business;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

public abstract class GenericService<TObject, TRepo extends JpaRepository<TObject, Integer>> {

	@Autowired
	public TRepo repository;

	@Transactional(readOnly = true)
	public List<TObject> getAll() {
		return repository.findAll();
	}

	public TObject findById(Integer id) {
		return repository.findOne(id);
	}

	public TObject addOrUpdate(TObject booking) {
		return repository.save(booking);
	}

	public boolean delete(Integer id) {
		repository.delete(id);
		return true;
	}

}