package site.metacoding.miniproject.web.dto.response;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import site.metacoding.miniproject.domain.need_skill.NeedSkill;

@Getter
@Setter
public class NoticeApplyDto {
	private Integer noticeId;
	private Integer company;
	private String noticeTitle;
	private String resumeTitle;
	private String address;
	private String companyName;
	private List<NeedSkill> needSkillList;
}
