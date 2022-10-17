package site.metacoding.miniproject.domain.company;

import java.util.List;

import site.metacoding.miniproject.web.dto.request.CompanyInsertDto;
import site.metacoding.miniproject.web.dto.response.CompanyRecommendDto;

public interface CompanyDao {
	public void insert(Company company);
	public Company findById(Integer companyId);
	public List<Company> findAll();
	public void update(Company company); //dto생각
	public void deleteById(Integer companyId);

	public List<CompanyRecommendDto> findToRecommned();
<<<<<<< HEAD
	
	public void companyInsert(CompanyInsertDto companyInsertDto);

	
=======
	public CompanyRecommendDto findToNoticeId(Integer noticeId);
>>>>>>> 5a200edbb386d22819d257ae4c2563dbfe3d13ff
	public Company findByUserId(Integer userId);
}
