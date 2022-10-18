package site.metacoding.miniproject.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import site.metacoding.miniproject.domain.company.CompanyDao;
import site.metacoding.miniproject.domain.user.User;
import site.metacoding.miniproject.domain.user.UserDao;
import site.metacoding.miniproject.web.dto.request.CompanyJoinDto;
import site.metacoding.miniproject.web.dto.request.CompanyMyPageDto;
import site.metacoding.miniproject.web.dto.request.CompanyMyPageUpdateDto;
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

	// 기업 마이페이지 정보 보기 id, dto(password,email ...)
	public CompanyMyPageDto 기업마이페이지정보보기(Integer userId) {
		CompanyMyPageDto companyMyPageDtoPS = companyDao.findToCompanyMyPage(userId);
		return companyMyPageDtoPS;
	}

	@Transactional
	public void 기업회원정보수정(CompanyMyPageUpdateDto companyMyPageUpdateDto) {
		companyDao.updateToCompany(companyMyPageUpdateDto);
		userDao.updateToUser(companyMyPageUpdateDto);
	}



}
