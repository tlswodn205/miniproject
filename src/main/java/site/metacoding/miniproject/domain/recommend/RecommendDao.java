package site.metacoding.miniproject.domain.recommend;

import java.util.List;


public interface RecommendDao {
	public void insert(Recommend recommend);
	public Recommend findById(Integer subscribe_id);
	public List<Recommend> findAll();
	public void update(Recommend recommend); // dto생각
	public void deleteById(Integer subscribe_id);
}
