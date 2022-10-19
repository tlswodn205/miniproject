package site.metacoding.miniproject.service;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import site.metacoding.miniproject.domain.resume.Resume;
import site.metacoding.miniproject.domain.resume.ResumeDao;
import site.metacoding.miniproject.web.dto.request.ResumeWriteDto;
import site.metacoding.miniproject.web.dto.response.ResumeDetailFormDto;

@RequiredArgsConstructor
@Service
public class ResumeService {
	private final ResumeDao resumeDao;

	public void 이력서등록하기(ResumeWriteDto resumeWriteDto) {
		resumeDao.save(resumeWriteDto);
		System.out.println(resumeWriteDto.getResumeTitle());
	}
	
	public ResumeDetailFormDto 이력서상세보기(Integer resumeId) {
		Resume resume = resumeDao.findById(resumeId);
		ResumeDetailFormDto resumeDetailFormDto = new ResumeDetailFormDto(resumeId, resume.getPersonId(), resume.getResumeTitle(), resume.getPhoto(), resume.getMyCloud(), resume.getIntroduction());
		return resumeDetailFormDto;
	}

}