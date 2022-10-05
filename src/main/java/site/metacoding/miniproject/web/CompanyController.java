package site.metacoding.miniproject.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import site.metacoding.miniproject.domain.company.CompanyDao;
import site.metacoding.miniproject.domain.user.User;
import site.metacoding.miniproject.domain.user.UserDao;
import site.metacoding.miniproject.service.CompanyService;
import site.metacoding.miniproject.service.UserService;
import site.metacoding.miniproject.web.dto.CMRespDto;
import site.metacoding.miniproject.web.dto.CompanyJoinDto;
import site.metacoding.miniproject.web.dto.PersonJoinDto;

@RequiredArgsConstructor
@Controller
public class CompanyController {
	
	private final CompanyService companyService;
	private final UserService userService;
	
	
	@PostMapping("/company/join")
	public @ResponseBody CMRespDto<?> joinPerson(@RequestBody CompanyJoinDto companyJoinDto){
		companyService.기업회원가입(companyJoinDto);
		User userPS = userService.유저네임으로유저찾기(companyJoinDto.getUsername());
        if (userPS == null) {
            return new CMRespDto<>(-1, "회원가입 실패", null);
        }
        return new CMRespDto<>(1, "회원가입 성공", null);
	}
}

