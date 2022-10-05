package site.metacoding.miniproject.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import site.metacoding.miniproject.domain.user.User;
import site.metacoding.miniproject.service.UserService;
import site.metacoding.miniproject.web.dto.CMRespDto;
import site.metacoding.miniproject.web.dto.LoginDto;

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
}
