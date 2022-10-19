package site.metacoding.miniproject.domain.resume;

import java.util.List;

import site.metacoding.miniproject.web.dto.request.ResumeWriteDto;

public interface ResumeDao {
	
	public void save(ResumeWriteDto resumeWriteDto);
	
	public void insert(Resume resume);

	public Resume findById(Integer resumeId);

	public List<Resume> findAll();

	public void update(Resume resume); // dto생각

	public void deleteById(Integer resumeId);
	
	public List<Resume> findByPersonId(Integer personId);
}
