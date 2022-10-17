 package site.metacoding.miniproject.web.dto.response;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class PersonInfoDto {
	private Integer personId;
	private Integer userId;
	private String personName;
	private String personEmail;
	private String personPhone;
	private Boolean isGender;
	private String address;
	private String degree;
	private Integer career;
	private Integer personSkillId;
	private String skill;
	private Timestamp createdAt;
}