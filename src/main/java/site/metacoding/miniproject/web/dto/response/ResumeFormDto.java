package site.metacoding.miniproject.web.dto.response;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import site.metacoding.miniproject.domain.person_skill.PersonSkill;

@Setter
@Getter
@AllArgsConstructor
public class ResumeFormDto {
    private Integer personId;
    private Integer userId;
    private String personName;
    private String personEmail;
    private String degree;
    private String address;
    private Integer career;
    private List<PersonSkill> personSkillList;
}

