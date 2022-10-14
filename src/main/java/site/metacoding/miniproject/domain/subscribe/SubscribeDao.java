package site.metacoding.miniproject.domain.subscribe;

import java.util.List;


public interface SubscribeDao {
	public List<Subscribe> findAll();
	public Subscribe findById();
	public void	insert(Subscribe subscribe);
	public void update(Subscribe subscribe);
	public void delete(int subscribeId);

}
