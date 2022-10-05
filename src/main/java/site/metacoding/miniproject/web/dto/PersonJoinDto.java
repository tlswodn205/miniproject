package site.metacoding.miniproject.web.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import site.metacoding.miniproject.domain.person.Person;
import site.metacoding.miniproject.domain.user.User;

@NoArgsConstructor
@Getter
public class PersonJoinDto {
	private String username;
	private String password;
	private String role;
	private String personName;
	private String personEmail;
	private boolean isGender;
	private String address;
	private String degree;
	private Integer career;
	
	public User toUser() {
		return new User(this.username, this.password, this.role);
	}
	
	public Person toPerson(int userId) {
		return new Person(userId, this.personName, this.personEmail, this.isGender, this.address, this.degree, this.career);
	}
}
