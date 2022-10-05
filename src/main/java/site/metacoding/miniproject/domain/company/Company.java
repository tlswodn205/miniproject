package site.metacoding.miniproject.domain.company;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class Company {
	private Integer companyId;
	private Integer userId;
	private String companyName;
	private String companyEmail;
	private String companyPhone;
	private String tech;
	private String address;
	private Integer history;
	private String introduction;
	private String photo;
	private String companyGoal;
	private String companyMind;
	private String ceoName;
	private Timestamp createdAt;
}
