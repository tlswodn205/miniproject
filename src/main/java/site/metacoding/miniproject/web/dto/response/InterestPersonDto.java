package site.metacoding.miniproject.web.dto.response;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import site.metacoding.miniproject.domain.person_skill.PersonSkill;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class InterestPersonDto {
	private Integer personId;
	private boolean Mark;
	private Integer recommendCount;
	private String personName;
	private Integer career;
	private String degree;
	private String address;
	private List<PersonSkill> personSkillList;
}
