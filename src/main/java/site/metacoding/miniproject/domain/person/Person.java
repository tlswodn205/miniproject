package site.metacoding.miniproject.domain.person;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class Person {
	private Integer personId;
	private Integer userId;
	private String personName;
	private String personEmail;
	private boolean isGender;
	private String address;
	private String degree;
	private Integer career;
	private Timestamp createdAt;
}

