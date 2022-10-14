package site.metacoding.miniproject.web;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.sym.Name;

import lombok.RequiredArgsConstructor;
import site.metacoding.miniproject.domain.company.Company;
import site.metacoding.miniproject.domain.user.User;
import site.metacoding.miniproject.service.CompanyService;
import site.metacoding.miniproject.service.UserService;
import site.metacoding.miniproject.util.BasicSkillList;
import site.metacoding.miniproject.web.dto.request.CompanyInsertDto;
import site.metacoding.miniproject.web.dto.request.CompanyJoinDto;
import site.metacoding.miniproject.web.dto.response.CMRespDto;
import site.metacoding.miniproject.web.dto.response.CompanyRecommendDto;

@RequiredArgsConstructor
@Controller
public class CompanyController {

	private final HttpSession session;
	private final CompanyService companyService;
	private final UserService userService;

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

	@GetMapping("/companyInsert")
	public String companyInsertForm() {
		User userPs = (User) session.getAttribute("principal");
		return "/company/companyInsert";
	}

	  // 기업 이력서 등록 페이지
	@PostMapping("/companyInsert/{companyId}")
	public @ResponseBody CMRespDto<?> resumeWrite(@RequestBody CompanyInsertDto companyInsertDto,
			@PathVariable Integer personId) {
		companyService.기업이력등록(personId, companyInsertDto);
		return new CMRespDto<>(1, "이력서 등록 성공", null);
	}

	//   //이력서 등록 페이지
	// @GetMapping("/company/CompanyInsertDto")
	// public String companyInsert(Model model) {
	// 	User userPS = (User)session.getAttribute("principal");
	// 	Integer id = companyService.컴퍼니아이디로찾기(null);
	// 	CompanyInsertDto companyPS = companyService.기업이력등록(id, null);
	// 	model.addAttribute("company", companyPS);
	// 	return "/company/CompanyInsertDto";
	// }
}
