package site.metacoding.miniproject.domain.notice;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public class Notice {
	private Integer noticeId;
	private Integer companyId;
	private String noticeTitle;
	private boolean isClosed;
	private String salary;
	private String degree;
	private Integer career;
	private String noticeContent;
	private Timestamp createdAt;
}
