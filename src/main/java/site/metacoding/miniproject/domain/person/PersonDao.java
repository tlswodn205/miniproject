package site.metacoding.miniproject.domain.person;

import java.util.List;


public interface PersonDao {
	public void insert(Person person);
	public Person findById(Integer personId);
	public List<Person> findAll();
	public void update(Person person); //dto생각
	public void deleteById(Integer personId);
}
