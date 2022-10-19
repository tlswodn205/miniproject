package site.metacoding.miniproject.domain.recommend;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.metacoding.miniproject.web.dto.response.RecommendDetailDto;

public interface RecommendDao {
	public List<Recommend> findAll();
	public Recommend findById();
	public void	insert(Recommend recommend);
	public void update(Recommend recommend);
	public void delete(int recommendId);
	public RecommendDetailDto findAboutsubject(@Param("userId") Integer userId, @Param("subjectId") Integer subjectId);
}
