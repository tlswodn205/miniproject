package site.metacoding.miniproject.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;
import site.metacoding.miniproject.service.UserService;

@RequiredArgsConstructor
@Controller
public class UserController {
	private final UserService userService;

}
