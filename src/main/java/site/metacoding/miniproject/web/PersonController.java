package site.metacoding.miniproject.web;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import site.metacoding.miniproject.domain.user.User;
import site.metacoding.miniproject.service.PersonService;
import site.metacoding.miniproject.service.UserService;
import site.metacoding.miniproject.util.BasicSkillList;
import site.metacoding.miniproject.web.dto.request.PersonJoinDto;
import site.metacoding.miniproject.web.dto.request.ResumeWriteDto;
import site.metacoding.miniproject.web.dto.response.CMRespDto;
import site.metacoding.miniproject.web.dto.response.InterestPersonDto;
import site.metacoding.miniproject.web.dto.response.PersonInfoDto;
import site.metacoding.miniproject.web.dto.response.ResumeFormDto;

@RequiredArgsConstructor
@Controller
public class PersonController {
	private final HttpSession session;
	private final PersonService personService;
	private final UserService userService;

	@PostMapping("/person/join")
	public @ResponseBody CMRespDto<?> joinPerson(@RequestBody PersonJoinDto personJoinDto) {
		System.out.println("===================");
		List<String> testArr = personJoinDto.getPersonSkillList();
		for(int i=0;i<testArr.size();i++) {
			System.out.println(testArr.get(i)+ " ");
		}
		System.out.println("===================");
		User userPS = userService.유저네임으로유저찾기(personJoinDto.getUsername());
		if (userPS != null) {
			return new CMRespDto<>(-1, "회원가입 실패", null);
		}
		personService.회원가입(personJoinDto);
		return new CMRespDto<>(1, "회원가입 성공", null);

	}

	// 개인 회원가입 페이지
	@GetMapping("/personJoinForm")
	public String perseonJoinForm(Model model) {
		model.addAttribute("skillList", BasicSkillList.getSkill());
		return "person/personJoinForm";

	}

	// 이력서 등록 페이지
	@GetMapping("/person/resumeWrite")
	public String resumeForm(Model model) {
		User userPS = (User) session.getAttribute("principal");
		Integer id = personService.개인번호갖고오기(userPS.getUserId());
		ResumeFormDto personPS = personService.이력서내용가져오기(id);
		model.addAttribute("person", personPS);
		return "person/resumeSaveForm";
	}

	@PostMapping("/save/resume/{personId}")
	public @ResponseBody CMRespDto<?> resumeWrite(@RequestBody ResumeWriteDto resumeWriteDto,
			@PathVariable Integer personId) {
		personService.이력서등록(resumeWriteDto, personId);
		return new CMRespDto<>(1, "이력서 등록 성공", null);
	}

	// 구직자 상세보기 페이지
	@GetMapping("PersonInfo/{personId}")
	public String 구직자상세보기(@PathVariable Integer personId, Model model) {
		List<PersonInfoDto> personInfoDto = personService.개인정보보기(personId);
		List<PersonInfoDto> personSkillInfoDto = personService.개인기술보기(personId);
		model.addAttribute("personInfoDto", personInfoDto);
		model.addAttribute("personSkillInfoDto", personSkillInfoDto);
		return "person/PersonInfo";
	}
	
	
	
	@PostMapping("/person/interestPersonList/personSkill")
	public @ResponseBody CMRespDto<List<InterestPersonDto>> interestPersonSkillList(@RequestBody List<String> skillList, Model model){		
		List<InterestPersonDto> interestPersonDto = personService.관심구직자리스트(personService.기술별관심구직자찾기(skillList));
		model.addAttribute("interestPersonDto", interestPersonDto);
		return new CMRespDto<>(1, "기술별 관심 구칙자 불러오기 완료", interestPersonDto);
	}
	

	
	@PostMapping("/person/interestPersonList/degree")
	public @ResponseBody CMRespDto<List<InterestPersonDto>> interestPersonDegreeList(String degree, Model model){
		System.out.println(degree);
		List<InterestPersonDto> interestPersonDto = personService.관심구직자리스트(personService.학력별관심구직자찾기(degree));
		model.addAttribute("interestPersonDto", interestPersonDto);
		return new CMRespDto<>(1, "학력별 관심 구칙자 불러오기 완료", interestPersonDto);
	}

	@GetMapping("/person/interestPersonList/{career}/career")
	public @ResponseBody CMRespDto<List<InterestPersonDto>> interestPersonDegreeList(@PathVariable Integer career, Model model){
		List<InterestPersonDto> interestPersonDto = personService.관심구직자리스트(personService.경력별관심구직자찾기(career));		
		model.addAttribute("interestPersonDto", interestPersonDto);
		return new CMRespDto<>(1, "경력별 관심 구칙자 불러오기 완료", interestPersonDto);
	}
	
	@GetMapping("/person/personRecommendList")
	public String personRecommendList(Model model) {
		int career=0;
		List<InterestPersonDto> interestPersonDto = personService.관심구직자리스트(personService.경력별관심구직자찾기(career));		
		model.addAttribute("interestPersonDto", interestPersonDto);
		return "/person/personRecommendList";
	}
}