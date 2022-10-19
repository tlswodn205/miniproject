package site.metacoding.miniproject.web.dto.response;

import java.sql.Timestamp;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import site.metacoding.miniproject.domain.need_skill.NeedSkill;

@Getter
@Setter
public class NoticeRespDto {
	private Integer noticeId;
	private String noticeTitle;
	private String salary;
	private String degree;
	private boolean isClosed;
	private List<NeedSkill> needSkill;
	private Timestamp createdAt;
}
