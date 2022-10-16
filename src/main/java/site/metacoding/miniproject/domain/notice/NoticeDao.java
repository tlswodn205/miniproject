package site.metacoding.miniproject.domain.notice;

import java.util.List;

import site.metacoding.miniproject.web.dto.response.NoticeRespDto;


public interface NoticeDao {
	public void insert(Notice notice);
	public Notice findById(Integer noticeId);
	public List<Notice> findAll();
	public void update(Notice notice); //dto생각
	public void deleteById(Integer noticeId);
	public List<NoticeRespDto> findByCompanyId(Integer companyId);
}
