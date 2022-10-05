package site.metacoding.miniproject.domain.recommend;

import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class Recommend {
	private Integer recommendId;
	private Integer userId;
	private Integer sugjectId;
	private String content;
}
