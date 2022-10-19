package site.metacoding.miniproject.web;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;
import site.metacoding.miniproject.domain.user.User;
import site.metacoding.miniproject.service.PersonService;
import site.metacoding.miniproject.service.ResumeService;
import site.metacoding.miniproject.web.dto.request.ResumeWriteDto;
import site.metacoding.miniproject.web.dto.response.CMRespDto;
import site.metacoding.miniproject.web.dto.response.ResumeDetailFormDto;
import site.metacoding.miniproject.web.dto.response.ResumeFormDto;

@RequiredArgsConstructor
@Controller
public class ResumeController {
	private final HttpSession session;
	private final PersonService personService;
	private final ResumeService resumeService;

	// 이력서 등록 페이지
	@GetMapping("/person/resumeWrite")
	public String resumeForm(Model model) {
		User userPS = (User) session.getAttribute("principal"); // 로그인 정보 가져오기
		Integer id = personService.개인번호갖고오기(userPS.getUserId()); // 구직자 개인번호 가져오기
		ResumeFormDto personPS = personService.이력서내용가져오기(id); // 이력서내용가져오기
		model.addAttribute("person", personPS);
		model.addAttribute("user", userPS);
		model.addAttribute("id", id);
		return "person/resumeWrite";
	}

	@PostMapping(value = "/resume/save")
	public @ResponseBody CMRespDto<?> create(@RequestPart("file") MultipartFile file,
			@RequestPart("resumeWriteDto") ResumeWriteDto resumeWriteDto) throws Exception {
		int pos = file.getOriginalFilename().lastIndexOf(".");
		String extension = file.getOriginalFilename().substring(pos + 1);
		String filePath = "C:\\temp\\img\\";
		String imgSaveName = UUID.randomUUID().toString();
		String imgName = imgSaveName + "." + extension;

		File makeFileFolder = new File(filePath);
		if (!makeFileFolder.exists()) {
			if (!makeFileFolder.mkdir()) {
				throw new Exception("File.mkdir():Fail.");
			}
		}

		File dest = new File(filePath, imgName);
		try {
			Files.copy(file.getInputStream(), dest.toPath());
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("사진저장");
		}
		resumeWriteDto.setPhoto(imgName);
		resumeService.이력서등록하기(resumeWriteDto);
		return new CMRespDto<>(1, "업로드 성공", imgName);
	}

	// 이력서 상세보기 페이지
	@GetMapping("/person/resumeDetail/{resumeId}")
	public String resumeDetail(Model model, @PathVariable Integer resumeId) {
		User userPS = (User) session.getAttribute("principal");
		ResumeDetailFormDto personPS2 = resumeService.이력서상세보기(resumeId);
		ResumeFormDto personPS = personService.이력서내용가져오기(personPS2.getPersonId()); // 이력서내용가져오기
		model.addAttribute("person", personPS);
		model.addAttribute("person2", personPS2);
		model.addAttribute("principal", userPS);
		return "person/resumeDetail";
	}

}
