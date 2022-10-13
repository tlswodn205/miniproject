package site.metacoding.miniproject.web.dto.request;

import lombok.Getter;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@Getter
public class CompanyInsertDto{
	
	private Integer companyId;
	private String photo;
	private String introduction;
	private String history;
	private String companyGoal;


}