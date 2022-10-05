package site.metacoding.miniproject.web.dto;

import lombok.Getter;
import site.metacoding.miniproject.domain.company.Company;
import site.metacoding.miniproject.domain.user.User;

@Getter
public class CompanyJoinDto {
	private String username;
	private String password;
	private String role;
	private Integer userId;
	private String companyName;
	private String companyEmail;
	private String companyPhone;
	private String tech;
	private String address;
	private String ceoName;
	

	public User toUser() {
		return new User(this.username, this.password, this.role);
	}
	
	public Company toCompany(Integer userId){
		return new Company(userId, this.companyName, this.companyEmail, this.companyPhone, this.tech,
				this.address, this.ceoName);
	}
}
