package site.metacoding.miniproject.domain.company;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;
import site.metacoding.miniproject.web.dto.request.CompanyMyPageUpdateDto;

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
	private String history;
	private String introduction;
	private String photo;
	private String companyGoal;
	private String ceoName;
	private Timestamp createdAt;
	
	public Company(Integer userId, String companyName, String companyEmail, String companyPhone, 
			String address, String tech, String ceoName) {
		super();
		this.userId = userId;
		this.companyName = companyName;
		this.companyEmail = companyEmail;
		this.companyPhone = companyPhone;
		this.tech = tech;
		this.address = address;
		this.ceoName = ceoName;
	}
}
