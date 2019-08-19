package com.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class SocialVO {
	
	private Long social_idx;
	private String api_id;
	private String email;
	private String name;
	private String type;
	private Date last_date;
	
	
}
