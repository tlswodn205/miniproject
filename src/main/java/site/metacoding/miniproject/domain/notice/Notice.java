package site.metacoding.miniproject.domain.notice;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class Notice {
	private Integer noticeId;
	private Integer companyId;
	private String noticeTitle;
	private boolean isClosed;
	private String salary;
	private String degree;
	private Timestamp createdAt;
}
