package site.metacoding.miniproject.domain.subscribe;

import java.util.List;


public interface SubscribeDao {
	public List<Subscribe> findAll();
	public Subscribe findById(int subscribeId);
	public void	insert(Subscribe subscribe);
	public void update(Subscribe subscribe);
	public void deleteById(int subscribeId);
	public List<Subscribe> findByUserId(int userId);

}
