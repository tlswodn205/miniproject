package site.metacoding.miniproject.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import site.metacoding.miniproject.domain.company.Company;
import site.metacoding.miniproject.domain.company.CompanyDao;
import site.metacoding.miniproject.domain.user.User;
import site.metacoding.miniproject.service.CompanyService;
import site.metacoding.miniproject.service.UserService;
import site.metacoding.miniproject.util.BasicSkillList;
import site.metacoding.miniproject.web.dto.request.CompanyJoinDto;
import site.metacoding.miniproject.web.dto.response.CMRespDto;
import site.metacoding.miniproject.web.dto.response.CompanyDetailRecomDto;
import site.metacoding.miniproject.web.dto.response.CompanyRecommendDto;
import site.metacoding.miniproject.web.dto.response.InterestPersonDto;
import site.metacoding.miniproject.web.dto.response.NoticeRespDto;
import site.metacoding.miniproject.web.dto.response.SubscribeDto;

@RequiredArgsConstructor
@Controller
public class CompanyController {

	private final CompanyService companyService;
	private final UserService userService;
	private final HttpSession session;

	// 기업회원가입
	@PostMapping("/company/join")
	public @ResponseBody CMRespDto<?> joinPerson(@RequestBody CompanyJoinDto companyJoinDto) {

		
		User userPS = userService.유저네임으로유저찾기(companyJoinDto.getUsername());
		if (userPS != null) {
			return new CMRespDto<>(-1, "회원가입 실패", null);
		}
		companyService.기업회원가입(companyJoinDto);
		return new CMRespDto<>(1, "회원가입 성공", null);


	}

	// 기업 회원가입 페이지
	@GetMapping("/companyJoinForm")
	public String companyJoinForm(Model model) {
		model.addAttribute("skillList",BasicSkillList.getSkill());
		return "/company/companyJoinForm";
	}

	// 기업추천 리스트 페이지
	@GetMapping("/company/recommendList")
	public String recommendList(Model model) {
		List<CompanyRecommendDto> companyRecommendDto = companyService.기업추천리스트보기();
		model.addAttribute("companyRecommendList", companyRecommendDto);
		return "/company/companyRecommendList";
	}
	
	@GetMapping("/company/matchingList")
	public String skillCompanyMatching(Model model) {
		List<CompanyRecommendDto> companyRecommendDto = companyService.기업추천리스트보기();
		model.addAttribute("companyRecommendList", companyRecommendDto);
		return "/company/skillCompanyMatching";
	}
	
	@PostMapping("/company/skillCompanyMatchingList/needSkill")
	public @ResponseBody CMRespDto<List<CompanyRecommendDto>> skillCompanyMatchingList(@RequestBody List<String> skillList, Model model){
		List<CompanyRecommendDto> CompanyRecommendDtoList = companyService.NoticeId로공고불러오기(companyService.기술별공고찾기(skillList));
		model.addAttribute("CompanyRecommendDtoList", CompanyRecommendDtoList);
		return new CMRespDto<List<CompanyRecommendDto>>(1, "기업불러오기 성공", CompanyRecommendDtoList);
	}
	
	@GetMapping("/company/subscribeManage")
	public String subscribeManage(Model model) {
		User userPS = (User) session.getAttribute("principal");
		List<SubscribeDto> subscribeDtoList = companyService.구독목록불러오기(userPS.getUserId());
		model.addAttribute("subscribeDtoList", subscribeDtoList);
		return "/company/subscribeManage";
	}
	
	@DeleteMapping("/company/deleteSubscribe/{subscribeId}")
	public CMRespDto<?> deleteSubscribe(@PathVariable Integer subscribeId) {
		companyService.구독취소(subscribeId);
		return new CMRespDto<>(1, "구독 취소", null);
	}
	
	@GetMapping("/company/companyDetail/{companyId}")
	public String companyDetail(@PathVariable Integer companyId, Model model) {
		User principal = (User) session.getAttribute("principal");
		Company company = companyService.기업한건불러오기(companyId);
		List<NoticeRespDto> noticeRespDtoList = companyService.CompanyId로공고불러오기(companyId);
		if(principal != null) {
			CompanyDetailRecomDto companyDetailRecomDto = companyService.기업추천불러오기(principal.getUserId(), company.getUserId());
			Integer subscribeId = companyService.구독Id불러오기(principal.getUserId(), company.getUserId());
			model.addAttribute("subscribeId", subscribeId);
			model.addAttribute("principal", principal);
			model.addAttribute("companyDetailRecomDto", companyDetailRecomDto);
		}else {
			CompanyDetailRecomDto companyDetailRecomDto = companyService.기업추천불러오기(null, company.getUserId());
			model.addAttribute("companyDetailRecomDto", companyDetailRecomDto);
		}
		
		model.addAttribute("company", company);
		model.addAttribute("noticeRespDtoList", noticeRespDtoList);
		return "/company/companyDetail";
	}
	
	@PostMapping("/company/subscribe/{subjectId}")
	public @ResponseBody CMRespDto<Integer> companySubscribe(@PathVariable Integer subjectId, Model model){
		User principal = (User) session.getAttribute("principal");
		Integer subscribeId =companyService.구독Id불러오기(principal.getUserId(), subjectId);
		if(subscribeId==null) {
			companyService.구독하기(principal.getUserId(),  subjectId);
			subscribeId =companyService.구독Id불러오기(principal.getUserId(), subjectId);
			return new CMRespDto<Integer> (1, "구독 완료", subscribeId);
		}
		companyService.구독취소(subscribeId);
		return new CMRespDto<Integer> (1, "구독 취소 완료", null);
	}
	
	@PostMapping("/company/recommend/{subjectId}")
	public @ResponseBody CMRespDto<CompanyDetailRecomDto> companyRecommend(@PathVariable Integer subjectId){
		User principal = (User) session.getAttribute("principal");
		CompanyDetailRecomDto companyDetailRecomDto = companyService.기업추천불러오기(principal.getUserId(), subjectId);
		if(companyDetailRecomDto.getRecommendId()==null) {
			companyService.기업추천하기(principal.getUserId(), subjectId);
			companyDetailRecomDto = companyService.기업추천불러오기(principal.getUserId(), subjectId);
			System.out.println(companyDetailRecomDto.getRecommendId());
			return new CMRespDto<CompanyDetailRecomDto> (1, "추천 완료", companyDetailRecomDto);
		}
		companyService.기업추천취소(companyDetailRecomDto.getRecommendId());
		companyDetailRecomDto = companyService.기업추천불러오기(principal.getUserId(), subjectId);
		return new CMRespDto<CompanyDetailRecomDto> (1, "추천 취소 완료", companyDetailRecomDto);
	}
}
