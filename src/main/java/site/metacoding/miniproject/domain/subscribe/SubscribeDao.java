package site.metacoding.miniproject.domain.subscribe;

import java.util.List;

import site.metacoding.miniproject.domain.resume.Resume;

public interface SubscribeDao {
	public void insert(Subscribe subscribe);
	public Resume findById(Integer subscribeId);
	public List<Subscribe> findAll();
	public void update(Subscribe subscribe); //dto생각
	public void deleteById(Integer subscribeId);
}
