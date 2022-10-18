package site.metacoding.miniproject.web;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import site.metacoding.miniproject.domain.user.User;
import site.metacoding.miniproject.service.CompanyService;
import site.metacoding.miniproject.service.UserService;
import site.metacoding.miniproject.util.BasicSkillList;
import site.metacoding.miniproject.web.dto.request.CompanyJoinDto;
import site.metacoding.miniproject.web.dto.request.CompanyMyPageDto;
import site.metacoding.miniproject.web.dto.request.CompanyMyPageUpdateDto;
import site.metacoding.miniproject.web.dto.response.CMRespDto;
import site.metacoding.miniproject.web.dto.response.CompanyRecommendDto;

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
		model.addAttribute("skillList", BasicSkillList.getSkill());
		return "/company/companyJoinForm";
	}

	// 기업추천 리스트 페이지
	@GetMapping("/company/recommendList")
	public String recommendList(Model model) {
		List<CompanyRecommendDto> companyRecommendDto = companyService.기업추천리스트보기();
		model.addAttribute("companyRecommendList", companyRecommendDto);
		return "/company/companyRecommendList";
	}


	// 기업 마이페이지
	@GetMapping("/companyMypage/{userId}")
	public String update(@PathVariable Integer userId, Model model) {
		CompanyMyPageDto companyMyPageDto = companyService.기업마이페이지정보보기(userId);
		model.addAttribute("companyMyPageDto", companyMyPageDto);
		return "company/companyMypage";
	}

	// 기업 마이페이지 수정하기
	@PutMapping("/api/companyMypage/{userId}") // 주소를 예쁘게 만들려고 형식적으로 받기
	public @ResponseBody CMRespDto<?> updateToCompany(@PathVariable Integer userId, @RequestBody CompanyMyPageUpdateDto companyMyPageUpdateDto){
		// userId는 주소때문에 형식적으로 받았으니까 사용은 안할께 (companyMyPageUpdateDto에 userId가 있으니까 참고해)
		companyService.기업회원정보수정(companyMyPageUpdateDto);
		return new CMRespDto<>(1,"기업회원정보수정 성공", null);
	}
	
	 
}
