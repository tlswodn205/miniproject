package site.metacoding.miniproject.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import lombok.RequiredArgsConstructor;
import site.metacoding.miniproject.domain.person.Person;
import site.metacoding.miniproject.domain.person.PersonDao;
import site.metacoding.miniproject.domain.person_skill.PersonSkillDao;
import site.metacoding.miniproject.domain.user.User;
import site.metacoding.miniproject.domain.user.UserDao;
import site.metacoding.miniproject.web.dto.request.PersonJoinDto;
import site.metacoding.miniproject.web.dto.response.InterestPersonDto;

@RequiredArgsConstructor
@Service
public class PersonService {

	private final PersonDao personDao;
	private final UserDao userDao;
	private final PersonSkillDao personSkillDao;

	public void 회원가입(PersonJoinDto personJoinDto) {
		userDao.insert(personJoinDto.toUser());
		User userPS = userDao.findByUsername(personJoinDto.getUsername());
		personDao.insert(personJoinDto.toPerson(userPS.getUserId()));
	}
	
	
	public List<Integer> 기술별관심구직자찾기(List<String> skillList){

		List<Integer> interesPersonIdList = new ArrayList<>();
		
		List<Person> personList = personDao.findAll();
		for (Person person : personList) {
			int count = 0;
			int personId = person.getPersonId();
			for (String skill : skillList) {
				if(personSkillDao.findBySkillAndPersonId(skill, personId) ==null) {
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
	
	public List<Integer> 학력별관심구직자찾기(String degree){
		List<Integer> personIdList = personDao.findByDegree(degree);
		return personIdList;
	}
	

	public List<Integer> 경력별관심구직자찾기(Integer career){
		System.out.println(career);
		List<Integer> personIdList = personDao.findByCareer(career);
		System.out.println(personIdList.get(0));
		return personIdList; 
	}
	
	public List<InterestPersonDto> 관심구직자리스트(List<Integer> personIdList){
		int count = 0;
		List<InterestPersonDto> interestPersonDtoList = new ArrayList<InterestPersonDto>();
		
		for (Integer personId : personIdList) {
			count++;
			Person person = personDao.findById(personId);
			InterestPersonDto  interestPersonDto = new InterestPersonDto(person.getPersonName(), person.getCareer(), person.getDegree(), person.getAddress(), personSkillDao.findByPersonId(personId));
			
			interestPersonDtoList.add(interestPersonDto);
			if(count>=20) {
				break;
			}
		}
		return interestPersonDtoList;
	}
}
