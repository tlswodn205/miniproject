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
import site.metacoding.miniproject.domain.company.CompanyDao;
import site.metacoding.miniproject.domain.user.User;
import site.metacoding.miniproject.service.CompanyService;
import site.metacoding.miniproject.service.UserService;
import site.metacoding.miniproject.util.BasicSkillList;
import site.metacoding.miniproject.web.dto.request.CompanyJoinDto;
import site.metacoding.miniproject.web.dto.response.CMRespDto;
import site.metacoding.miniproject.web.dto.response.CompanyRecommendDto;
import site.metacoding.miniproject.web.dto.response.InterestPersonDto;
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
		System.out.println(companyRecommendDto.get(0).getNoticeId());
		System.out.println(companyRecommendDto.get(0).getNeedSkillList().get(0).getSkill());
		return "/company/companyRecommendList";
	}
	
	@GetMapping("/company/matchingList")
	public String skillCompanyMatching(Model model) {
		List<CompanyRecommendDto> companyRecommendDto = companyService.기업추천리스트보기();
		model.addAttribute("companyRecommendList", companyRecommendDto);
		System.out.println(companyRecommendDto.get(0).getNoticeId());
		System.out.println(companyRecommendDto.get(0).getNeedSkillList().get(0).getSkill());
		return "/company/skillCompanyMatching";
	}
	
	@PostMapping("/company/skillCompanyMatchingList/needSkill")
	public @ResponseBody CMRespDto<List<CompanyRecommendDto>> skillCompanyMatchingList(@RequestBody List<String> skillList, Model model){
		List<CompanyRecommendDto> CompanyRecommendDtoList = companyService.NoticeId로공고불러오기(companyService.기술별공고찾기(skillList));
		model.addAttribute("CompanyRecommendDtoList", CompanyRecommendDtoList);
		System.out.println(CompanyRecommendDtoList.get(0).getCreatedAt());
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
}
