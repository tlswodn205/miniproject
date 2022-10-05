package site.metacoding.miniproject.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import site.metacoding.miniproject.domain.user.User;
import site.metacoding.miniproject.service.PersonService;
import site.metacoding.miniproject.service.UserService;
import site.metacoding.miniproject.web.dto.CMRespDto;
import site.metacoding.miniproject.web.dto.PersonJoinDto;

@RequiredArgsConstructor
@Controller
public class PersonController {
	
	private final PersonService personService;
	private final UserService userService;

	@PostMapping("/person/join")
	public @ResponseBody CMRespDto<?> joinPerson(@RequestBody PersonJoinDto personJoinDto){
		personService.회원가입(personJoinDto);
		User userPS = userService.유저네임으로유저찾기(personJoinDto.getUsername());
        if (userPS == null) {
            return new CMRespDto<>(-1, "회원가입 실패", null);
        }
        return new CMRespDto<>(1, "회원가입 성공", null);
	}
}