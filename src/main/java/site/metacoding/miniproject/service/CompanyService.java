package site.metacoding.miniproject.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import site.metacoding.miniproject.domain.company.Company;
import site.metacoding.miniproject.domain.company.CompanyDao;
import site.metacoding.miniproject.domain.user.User;
import site.metacoding.miniproject.domain.user.UserDao;
import site.metacoding.miniproject.web.dto.request.CompanyInsertDto;
import site.metacoding.miniproject.web.dto.request.CompanyJoinDto;
import site.metacoding.miniproject.web.dto.response.CompanyRecommendDto;

@RequiredArgsConstructor
@Service
public class CompanyService {

	private final CompanyDao companyDao;
	private final UserDao userDao;

	@Transactional(rollbackFor = { RuntimeException.class })
	public void 기업회원가입(CompanyJoinDto companyJoinDto) {
		userDao.insert(companyJoinDto.toUser());
		User userPS = userDao.findByUsername(companyJoinDto.getUsername());
		companyDao.insert(companyJoinDto.toCompany(userPS.getUserId()));
	}

	public List<CompanyRecommendDto> 기업추천리스트보기() {

		return companyDao.findToRecommned();
	}

	public CompanyInsertDto 기업이력등록(Integer CompanyId, CompanyInsertDto companyInsertDto) {
		companyInsertDto.setCompanyId(CompanyId);
		companyDao.companyInsert(companyInsertDto);
		return companyInsertDto;
	}

	public Company 유저아이디로찾기(Integer userId) {
		return companyDao.findByUserId(userId);
	}
	



}