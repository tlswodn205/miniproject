package site.metacoding.miniproject.web;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import lombok.RequiredArgsConstructor;
import site.metacoding.miniproject.domain.company.Company;
import site.metacoding.miniproject.domain.need_skill.NeedSkill;
import site.metacoding.miniproject.domain.notice.Notice;
import site.metacoding.miniproject.domain.user.User;
import site.metacoding.miniproject.service.CompanyService;
import site.metacoding.miniproject.service.PersonService;
import site.metacoding.miniproject.service.UserService;
import site.metacoding.miniproject.util.BasicSkillList;
import site.metacoding.miniproject.web.dto.request.CompanyInsertDto;
import site.metacoding.miniproject.web.dto.request.CompanyJoinDto;
import site.metacoding.miniproject.web.dto.request.NoticeInsertDto;
import site.metacoding.miniproject.web.dto.response.CMRespDto;
import site.metacoding.miniproject.web.dto.response.RecommendDetailDto;
import site.metacoding.miniproject.web.dto.response.CompanyRecommendDto;

import site.metacoding.miniproject.web.dto.response.NoticeRespDto;
import site.metacoding.miniproject.web.dto.response.SubscribeDto;

@RequiredArgsConstructor
@Controller
public class CompanyController {
	private final HttpSession session;
	private final CompanyService companyService;
	private final UserService userService;
	private final PersonService personService;

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

	
	
	
	
	@GetMapping("/company/companyInsertWrite")
	public String companyInsertForm(Model model) {
		User userPs = (User) session.getAttribute("principal");
		Company companyPs = companyService.유저아이디로찾기(userPs.getUserId());
		model.addAttribute("company", companyPs);
		return "/company/companyInsertWrite";
	}

	
	
	@PostMapping(value = "/company/companyInsert/{companyId}")
	public @ResponseBody CMRespDto<?> create(@RequestPart("file") MultipartFile file,@PathVariable Integer companyId,
			@RequestPart("companyInsertDto") CompanyInsertDto companyInsertDto) throws Exception {
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
		companyInsertDto.setPhoto(imgName);
		companyService.기업이력등록(companyId,companyInsertDto);
		return new CMRespDto<>(1, "업로드 성공", imgName);
	}
	

	@GetMapping("/company/matchingList")
	public String skillCompanyMatching(Model model) {
		List<CompanyRecommendDto> companyRecommendDto = companyService.기업추천리스트보기();
		model.addAttribute("companyRecommendList", companyRecommendDto);
		return "/company/skillCompanyMatching";
	}
	
	@PostMapping("/company/skillCompanyMatchingList/needSkill")
	public @ResponseBody CMRespDto<List<CompanyRecommendDto>> skillCompanyMatchingList(@RequestBody List<String> skillList, Model model){
		List<CompanyRecommendDto> CompanyRecommendDtoList = companyService.NoticeId로공고불러오기(companyService.기술별공고찾기(skillList));
		model.addAttribute("CompanyRecommendDtoList", CompanyRecommendDtoList);
		return new CMRespDto<List<CompanyRecommendDto>>(1, "기업불러오기 성공", CompanyRecommendDtoList);
	}
	
	@GetMapping("/company/subscribeManage")
	public String subscribeManage(Model model) {
		User userPS = (User) session.getAttribute("principal");
		List<SubscribeDto> subscribeDtoList = companyService.구독목록불러오기(userPS.getUserId());
		model.addAttribute("subscribeDtoList", subscribeDtoList);
		return "/company/subscribeManage";
	}
	
	@DeleteMapping("/company/deleteSubscribe/{subscribeId}")
	public CMRespDto<?> deleteSubscribe(@PathVariable Integer subscribeId) {
		companyService.구독취소(subscribeId);
		return new CMRespDto<>(1, "구독 취소", null);
	}
	
	@GetMapping("/company/companyDetail/{companyId}")
	public String companyDetail(@PathVariable Integer companyId, Model model) {
		User userPS = (User) session.getAttribute("principal");
		Company company = companyService.기업한건불러오기(companyId);
		List<NoticeRespDto> noticeRespDtoList = companyService.CompanyId로공고불러오기(companyId);
		if(userPS != null) {
			RecommendDetailDto recommendDetailDto = companyService.기업추천불러오기(userPS.getUserId(), company.getUserId());
			Integer subscribeId = companyService.구독Id불러오기(userPS.getUserId(), company.getUserId());
			model.addAttribute("subscribeId", subscribeId);
			model.addAttribute("principal", userPS);
			model.addAttribute("recommendDetailDto", recommendDetailDto);
		}else {
			RecommendDetailDto recommendDetailDto = companyService.기업추천불러오기(null, company.getUserId());
			model.addAttribute("recommendDetailDto", recommendDetailDto);
		}
		
		model.addAttribute("company", company);
		model.addAttribute("noticeRespDtoList", noticeRespDtoList);
		return "/company/companyDetail";
	}
	
	@PostMapping("/company/subscribe/{subjectId}")
	public @ResponseBody CMRespDto<Integer> companySubscribe(@PathVariable Integer subjectId, Model model){
		User principal = (User) session.getAttribute("principal");
		Integer subscribeId =companyService.구독Id불러오기(principal.getUserId(), subjectId);
		if(subscribeId==null) {
			companyService.구독하기(principal.getUserId(),  subjectId);
			subscribeId =companyService.구독Id불러오기(principal.getUserId(), subjectId);
			return new CMRespDto<Integer> (1, "구독 완료", subscribeId);
		}
		companyService.구독취소(subscribeId);
		return new CMRespDto<Integer> (1, "구독 취소 완료", null);
	}
	
	@PostMapping("/company/recommend/{subjectId}")
	public @ResponseBody CMRespDto<RecommendDetailDto> companyRecommend(@PathVariable Integer subjectId){
		User principal = (User) session.getAttribute("principal");
		RecommendDetailDto recommendDetail = companyService.기업추천불러오기(principal.getUserId(), subjectId);
		if(recommendDetail.getRecommendId()==null) {
			companyService.기업추천하기(principal.getUserId(), subjectId);
			recommendDetail = companyService.기업추천불러오기(principal.getUserId(), subjectId);
			System.out.println(recommendDetail.getRecommendId());
			return new CMRespDto<RecommendDetailDto> (1, "추천 완료", recommendDetail);
		}
		companyService.기업추천취소(recommendDetail.getRecommendId());
		recommendDetail = companyService.기업추천불러오기(principal.getUserId(), subjectId);
		return new CMRespDto<RecommendDetailDto> (1, "추천 취소 완료", recommendDetail);
	}
	
	@GetMapping("/company/noticeLoad")
	public String noticeLoad(Model model) {
		User userPS = (User) session.getAttribute("principal");
		Company company = companyService.유저아이디로찾기(userPS.getUserId());
		List<NoticeRespDto> noticeRespDtoList = companyService.CompanyId로공고불러오기(company.getCompanyId());
		model.addAttribute("noticeRespDtoList", noticeRespDtoList);
		return "/company/noticeLoad";
	}
	
	@GetMapping("/company/noticeWrite")
	public String noticeWrite(Model model) {
		User userPS = (User) session.getAttribute("principal");
		Company company = companyService.유저아이디로찾기(userPS.getUserId());
		model.addAttribute("company", company);
		return "/company/noticeWrite";
	}
	
	@PostMapping("/company/noticeInsert")
	public @ResponseBody CMRespDto<?> noticeInsert(@RequestBody NoticeInsertDto noticeInsertDto){
		companyService.공고등록하기(noticeInsertDto);
		return new CMRespDto<>(1, "공고 등록 완료", null);
	}
	
	@GetMapping("/company/noticeDetail/{noticeId}")
	public String noticeDetail(@PathVariable Integer noticeId, Model model){
		Notice notice = personService.공고하나불러오기(noticeId);
		List<NeedSkill> needSkillList = companyService.noticeId로필요기술들고오기(noticeId);
		System.out.println(notice.getNoticeContent());
		model.addAttribute("notice", notice);
		model.addAttribute("needSkillList", needSkillList);
		return "/company/noticeDetail";
	}
}
