package site.metacoding.miniproject.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import site.metacoding.miniproject.domain.company.CompanyDao;
import site.metacoding.miniproject.domain.need_skill.NeedSkill;
import site.metacoding.miniproject.domain.need_skill.NeedSkillDao;
import site.metacoding.miniproject.domain.notice.Notice;
import site.metacoding.miniproject.domain.notice.NoticeDao;
import site.metacoding.miniproject.domain.subscribe.Subscribe;
import site.metacoding.miniproject.domain.subscribe.SubscribeDao;
import site.metacoding.miniproject.domain.user.User;
import site.metacoding.miniproject.domain.user.UserDao;
import site.metacoding.miniproject.web.dto.request.CompanyJoinDto;
import site.metacoding.miniproject.web.dto.response.CompanyRecommendDto;
import site.metacoding.miniproject.web.dto.response.SubscribeDto;

@RequiredArgsConstructor
@Service
public class CompanyService {

	private final CompanyDao companyDao;
	private final UserDao userDao;
	private final NeedSkillDao needSkillDao;
	private final NoticeDao noticeDao;
	private final SubscribeDao subscribeDao;
	
	@Transactional(rollbackFor = {RuntimeException.class})
	public void 기업회원가입(CompanyJoinDto companyJoinDto) {
		userDao.insert(companyJoinDto.toUser());
		User userPS = userDao.findByUsername(companyJoinDto.getUsername());
		companyDao.insert(companyJoinDto.toCompany(userPS.getUserId()));
	}
	
	public List<CompanyRecommendDto> 기업추천리스트보기() {	
		List<CompanyRecommendDto> companyRecommendDtoList = companyDao.findToRecommned();
		
		
		for (int i = 0; i < companyRecommendDtoList.size(); i++) {
			List<NeedSkill> needSkillList = needSkillDao.findByNoticeId(companyRecommendDtoList.get(i).getNoticeId());
			companyRecommendDtoList.get(i).setNeedSkillList(needSkillList);
		}
		return companyRecommendDtoList;
	}
	
	public List<Integer> 기술별공고찾기(List<String> skillList){
		List<Notice> noticeIds = noticeDao.findAll();
		List<Integer> noticeIdList = new ArrayList<>();
		
		for (int i = 0; i < noticeIds.size(); i++) {
			int count = 0;
			for (int j = 0; j < skillList.size(); j++) {
				if(needSkillDao.findBySkillAndNoticeId(skillList.get(j), noticeIds.get(i).getNoticeId()) !=null) {
					count++;
				}
			}
			if(skillList.size()==count) {
				noticeIdList.add(noticeIds.get(i).getNoticeId());
				System.out.println(count);
			}
		}
		return noticeIdList;
	}
	
	public List<CompanyRecommendDto> NoticeId로공고불러오기(List<Integer> noticeList){
		List<CompanyRecommendDto> CompanyRecommendDtoList = new ArrayList<>();
		for (int i = 0; i < noticeList.size(); i++) {
			CompanyRecommendDto companyRecommendDto = companyDao.findToNoticeId(noticeList.get(i));
			companyRecommendDto.setNeedSkillList(needSkillDao.findByNoticeId(noticeList.get(i)));
			CompanyRecommendDtoList.add(companyRecommendDto);
			if(i>=19) {
				break;
			}
		}
		return CompanyRecommendDtoList;
	}
	

	
	public List<SubscribeDto> 구독목록불러오기(int userId){
		List<Subscribe> subscribeList = subscribeDao.findByUserId(userId);
		List<SubscribeDto> subscribeDtoList = new ArrayList<>();
		for (int i = 0; i < subscribeList.size(); i++) {
			subscribeDtoList.add(new SubscribeDto(subscribeList.get(i).getSubscribeId(), companyDao.findByUserId(subscribeList.get(0).getSubjectId()).getCompanyId(), companyDao.findByUserId(subscribeList.get(0).getSubjectId()).getCompanyName()));
		}
		return subscribeDtoList;
	}
	
	public void 구독취소(int subscribeId) {
		subscribeDao.deleteById(subscribeId);
	}
}
