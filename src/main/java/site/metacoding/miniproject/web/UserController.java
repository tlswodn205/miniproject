package site.metacoding.miniproject.web;

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
import site.metacoding.miniproject.domain.person.Person;
import site.metacoding.miniproject.domain.user.User;
import site.metacoding.miniproject.service.UserService;
import site.metacoding.miniproject.web.dto.request.LoginDto;
import site.metacoding.miniproject.web.dto.response.CMRespDto;
import org.springframework.web.bind.annotation.RequestParam;


@RequiredArgsConstructor
@Controller
public class UserController {
    private final UserService userService;
    private final HttpSession session;

    @PostMapping("/login")
    public @ResponseBody CMRespDto<?> login(@RequestBody LoginDto loginDto) {
 
        User principal = userService.로그인(loginDto);
        if (principal == null) {
            return new CMRespDto<>(-1, "로그인실패", null);
        }
        session.setAttribute("principal", principal);

        User isLogin = (User) session.getAttribute("principal");
        return new CMRespDto<>(1, "로그인성공", null);
    }
    
    //로그인 페이지
    @GetMapping("/loginForm")
    public String loginForm() {
    	return "user/login";
    }
    
    //로그아웃
    @GetMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/loginForm";
	}
    
  //메인 페이지
    @GetMapping({"/mainForm","/"})
    public String mainForm() {
        return "board/main";
    }
    
    // // role 구분하기 연습
    // @GetMapping("/rolesplit")
    // public 
    // User principal = userService.유저롤로개인기업구분하기(null);
    
    @DeleteMapping("/deleteuser/{userid}")
    public @ResponseBody CMRespDto<?> deleteUserId(@PathVariable Integer userid) {
        userService.유저삭제하기(userid);
        return new CMRespDto<>(userid, "유저삭제완료", null);
    }
    } 