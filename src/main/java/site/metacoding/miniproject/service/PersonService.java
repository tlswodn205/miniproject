package site.metacoding.miniproject.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import site.metacoding.miniproject.domain.person.Person;
import site.metacoding.miniproject.domain.person.PersonDao;
import site.metacoding.miniproject.domain.person_skill.PersonSkillDao;
import site.metacoding.miniproject.domain.resume.Resume;
import site.metacoding.miniproject.domain.resume.ResumeDao;
import site.metacoding.miniproject.domain.user.User;
import site.metacoding.miniproject.domain.user.UserDao;
import site.metacoding.miniproject.web.dto.request.PersonJoinDto;
import site.metacoding.miniproject.web.dto.request.ResumeWriteDto;
import site.metacoding.miniproject.web.dto.response.PersonInfoDto;
import site.metacoding.miniproject.web.dto.response.ResumeFormDto;
import site.metacoding.miniproject.web.dto.response.InterestPersonDto;

@RequiredArgsConstructor
@Service
public class PersonService {

	private final PersonDao personDao;
	private final UserDao userDao;
	private final PersonSkillDao personSkillDao;
	private final ResumeDao resumeDao;

	public void 회원가입(PersonJoinDto personJoinDto) {
		userDao.insert(personJoinDto.toUser());
		User userPS = userDao.findByUsername(personJoinDto.getUsername());
		personDao.insert(personJoinDto.toPerson(userPS.getUserId()));
	}
	
	
	public List<Integer> 기술별관심구직자찾기(List<String> skillList){

		List<Integer> interesPersonIdList = new ArrayList<Integer>();

		List<Person> personList = personDao.findAll();
		
		for(int i=0; i<personList.size(); i++) {
			int count = 0;
			int personId = personList.get(i).getPersonId();
			for(int j=0; j<skillList.size(); j++) {
				if(personSkillDao.findBySkillAndPersonId(skillList.get(j) , personId) ==null) {
					continue;
				}
				count++;
			}
			if(count>=skillList.size()) {
				interesPersonIdList.add(personId);
			}
		}
		
		return interesPersonIdList;
	}

	public List<Integer> 학력별관심구직자찾기(String degree) {
		List<Integer> personIdList = personDao.findByDegree(degree);
		return personIdList;
	}
	
	public List<Integer> 경력별관심구직자찾기(Integer career){
		List<Integer> personIdList = personDao.findByCareer(career);
		return personIdList; 
	}


	public List<InterestPersonDto> 관심구직자리스트(List<Integer> personIdList){
		List<InterestPersonDto> interestPersonDtoList = new ArrayList<InterestPersonDto>();
		int count = 0;
		
		for (int i = 0; i < personIdList.size(); i++) {
			count++;
			Person person = personDao.findById(personIdList.get(i));
			InterestPersonDto  interestPersonDto = new InterestPersonDto(person.getPersonId(), person.getPersonName(), person.getCareer(), person.getDegree(), person.getAddress(), personSkillDao.findByPersonId(personIdList.get(i)));
			
			interestPersonDtoList.add(interestPersonDto);
			if(count>=20) {
				break;
			}
		}
		
		return interestPersonDtoList;
	}

	public void 이력서등록(ResumeWriteDto resumeWriteDto, Integer personId) {
		Resume resume = resumeWriteDto.toEntity(personId);
		resumeDao.insert(resume);
	}

	public Integer 개인번호갖고오기(Integer userId) {
		return personDao.findToId(userId);
	}
	
	public List<PersonInfoDto> 개인정보보기(Integer personId){
		return personDao.personInfo(personId);
	}

	public List<PersonInfoDto> 개인기술보기(Integer personId){
		return personSkillDao.personSkillInfo(personId);
	}
}
