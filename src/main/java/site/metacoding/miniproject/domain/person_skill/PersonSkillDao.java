package site.metacoding.miniproject.domain.person_skill;

import java.util.List;

import site.metacoding.miniproject.web.dto.response.PersonInfoDto;

public interface PersonSkillDao {
	public void insert(PersonSkill personSkill);
	public PersonSkill findById(Integer personSkillId);
	public List<PersonSkill> findAll();
	public List<PersonInfoDto> personSkillInfo(Integer personId);
	public void update(PersonSkill personSkill); //dto생각
	public void deleteById(Integer personSkillId);
}