package site.metacoding.miniproject.web.dto.request;

import lombok.Getter;
import lombok.Setter;
import site.metacoding.miniproject.domain.resume.Resume;

@Getter
@Setter
public class ResumeWriteDto {
	private Integer personId;
	private Integer resumeId;
	private String resumeTitle;
	private String photo;
	private String introduction;
	private String address;
	private String myCloud;

    public Resume toEntity(Integer personId) {
        return new Resume(personId, this.resumeTitle, this.photo, this.introduction, this.myCloud);
    }
}
