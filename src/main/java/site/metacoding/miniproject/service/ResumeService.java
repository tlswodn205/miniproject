package site.metacoding.miniproject.service;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import site.metacoding.miniproject.domain.resume.ResumeDao;
import site.metacoding.miniproject.web.dto.request.ResumeWriteDto;

@RequiredArgsConstructor
@Service
public class ResumeService {
	private final ResumeDao resumeDao;

	public void 이력서등록하기(ResumeWriteDto resumeWriteDto) {
		resumeDao.save(resumeWriteDto);
		System.out.println(resumeWriteDto.getResumeTitle());
	}

}