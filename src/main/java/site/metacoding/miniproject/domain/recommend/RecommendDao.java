package site.metacoding.miniproject.domain.recommend;

import java.util.List;

public interface RecommendDao {
	public List<Recommend> findAll();
	public Recommend findById();
	public void	insert(Recommend recommend);
	public void update(Recommend recommend);
	public void delete(int recommendId);
}
