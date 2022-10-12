package site.metacoding.miniproject.web;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import site.metacoding.miniproject.domain.user.User;
import site.metacoding.miniproject.service.PersonService;
import site.metacoding.miniproject.service.UserService;
import site.metacoding.miniproject.web.dto.request.PersonJoinDto;
import site.metacoding.miniproject.web.dto.response.CMRespDto;
import site.metacoding.miniproject.web.dto.response.InterestPersonDto;

@RequiredArgsConstructor
@Controller
public class PersonController {

	private final PersonService personService;
	private final UserService userService;

	@PostMapping("/person/join")
	public @ResponseBody CMRespDto<?> joinPerson(@RequestBody PersonJoinDto personJoinDto) {
		personService.회원가입(personJoinDto);
		User userPS = userService.유저네임으로유저찾기(personJoinDto.getUsername());
		if (userPS == null) {
			return new CMRespDto<>(-1, "회원가입 실패", null);
		}
		return new CMRespDto<>(1, "회원가입 성공", null);
	}
	
	@PostMapping("/person/interestPersonList/personSkill")
	public @ResponseBody List<InterestPersonDto> interestPersonSkillList(@RequestBody List<String> skillList){
		
		List<InterestPersonDto> interestPersonDto = personService.관심구직자리스트(personService.기술별관심구직자찾기(skillList));
		return interestPersonDto;
	}
	

	
	@PostMapping("/person/interestPersonList/degree")
	public @ResponseBody List<InterestPersonDto> interestPersonDegreeList(String degree){
		List<InterestPersonDto> interestPersonDto = personService.관심구직자리스트(personService.학력별관심구직자찾기(degree));
		return interestPersonDto;
	}

	@GetMapping("/person/interestPersonList/{career}/career")
	public @ResponseBody List<InterestPersonDto> interestPersonDegreeList(@PathVariable Integer career){
		
		List<InterestPersonDto> interestPersonDto = personService.관심구직자리스트(personService.경력별관심구직자찾기(career));
		return interestPersonDto;
	}
}