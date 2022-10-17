package site.metacoding.miniproject.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import site.metacoding.miniproject.domain.company.Company;
import site.metacoding.miniproject.domain.company.CompanyDao;
import site.metacoding.miniproject.domain.need_skill.NeedSkill;
import site.metacoding.miniproject.domain.need_skill.NeedSkillDao;
import site.metacoding.miniproject.domain.notice.Notice;
import site.metacoding.miniproject.domain.notice.NoticeDao;
import site.metacoding.miniproject.domain.recommend.Recommend;
import site.metacoding.miniproject.domain.recommend.RecommendDao;
import site.metacoding.miniproject.domain.subscribe.Subscribe;
import site.metacoding.miniproject.domain.subscribe.SubscribeDao;
import site.metacoding.miniproject.domain.user.User;
import site.metacoding.miniproject.domain.user.UserDao;
import site.metacoding.miniproject.web.dto.request.CompanyInsertDto;
import site.metacoding.miniproject.web.dto.request.CompanyJoinDto;
import site.metacoding.miniproject.web.dto.request.NoticeInsertDto;
import site.metacoding.miniproject.web.dto.response.RecommendDetailDto;
import site.metacoding.miniproject.web.dto.response.CompanyRecommendDto;
import site.metacoding.miniproject.web.dto.response.NoticeRespDto;
import site.metacoding.miniproject.web.dto.response.SubscribeDto;

@RequiredArgsConstructor
@Service
public class CompanyService {

	private final CompanyDao companyDao;
	private final UserDao userDao;
	private final NeedSkillDao needSkillDao;
	private final NoticeDao noticeDao;
	private final SubscribeDao subscribeDao;
	private final RecommendDao recommendDao;
	
	public void 기업회원가입(CompanyJoinDto companyJoinDto) {
		userDao.insert(companyJoinDto.toUser());
		User userPS = userDao.findByUsername(companyJoinDto.getUsername());
		companyDao.insert(companyJoinDto.toCompany(userPS.getUserId()));
	}



	public CompanyInsertDto 기업이력등록(Integer CompanyId, CompanyInsertDto companyInsertDto) {
		companyInsertDto.setCompanyId(CompanyId);
		companyDao.companyInsert(companyInsertDto);
		return companyInsertDto;
	}

	public Company 유저아이디로찾기(Integer userId) {
		return companyDao.findByUserId(userId);
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
		List<CompanyRecommendDto> companyRecommendDtoList = new ArrayList<>();
		for (int i = 0; i < noticeList.size(); i++) {
			CompanyRecommendDto companyRecommendDto = companyDao.findToNoticeId(noticeList.get(i));
			companyRecommendDto.setNeedSkillList(needSkillDao.findByNoticeId(noticeList.get(i)));
			companyRecommendDtoList.add(companyRecommendDto);
			if(i>=19) {
				break;
			}
		}
		return companyRecommendDtoList;
	}
	

	
	public List<SubscribeDto> 구독목록불러오기(int userId){
		System.out.println(userId);
		List<Subscribe> subscribeList = subscribeDao.findByUserId(userId);
		List<SubscribeDto> subscribeDtoList = new ArrayList<>();
		for (int i = 0; i < subscribeList.size(); i++) {
			subscribeDtoList.add(new SubscribeDto(subscribeList.get(i).getSubscribeId(), companyDao.findByUserId(subscribeList.get(i).getSubjectId()).getCompanyId(), companyDao.findByUserId(subscribeList.get(i).getSubjectId()).getCompanyName()));
		}
		return subscribeDtoList;
	}
	
	public void 구독취소(Integer subscribeId) {
		subscribeDao.deleteById(subscribeId);
	}
	
	public Company 기업한건불러오기(int companyId) {
		return companyDao.findById(companyId);
	}
	
	public List<NoticeRespDto> CompanyId로공고불러오기(Integer companyId){
		List<NoticeRespDto> noticeRespDtoList = noticeDao.findByCompanyId(companyId);
		for (int i = 0; i < noticeRespDtoList.size(); i++) {
			noticeRespDtoList.get(i).setNeedSkill((needSkillDao.findByNoticeId(noticeRespDtoList.get(i).getNoticeId())));
		}
		return noticeRespDtoList;
	}	
	public RecommendDetailDto 기업추천불러오기(Integer userId, Integer subjectId) {
		return recommendDao.findAboutsubject(userId, subjectId);
	}
	
	public void 기업추천하기(Integer userId, Integer subjectId) {
		Recommend recommend = new Recommend(null, userId, subjectId, null);
		recommendDao.insert(recommend);
	}
	
	public void 기업추천취소(Integer recommendId) {
		recommendDao.delete(recommendId);
	}
	
	public Integer 구독Id불러오기(Integer userId, Integer subjectId) {
		return subscribeDao.findByUserIdAndSubjectId(userId, subjectId);
	}
	
	public void 구독하기(Integer userId, Integer subjectId) {
		Subscribe subscribe = new Subscribe(null, userId, subjectId, null);
		subscribeDao.insert(subscribe);
	}


	public void 공고등록하기(NoticeInsertDto noticeInsertDto) {
		noticeDao.insert(noticeInsertDto.toNotice());
		System.out.println(noticeDao.findRecentNoticeId(noticeInsertDto.getCompanyId()));
		for (int i = 0; i < noticeInsertDto.getNeedSkill().size(); i++) {
			needSkillDao.insert(noticeInsertDto.toNeedSkill(noticeDao.findRecentNoticeId(noticeInsertDto.getCompanyId()), i));
		}
		
	}

	public List<NeedSkill> noticeId로필요기술들고오기(Integer noticeId) {
		return needSkillDao.findByNoticeId(noticeId);
	}
}
