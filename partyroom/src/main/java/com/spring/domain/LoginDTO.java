package com.spring.domain;

import lombok.Data;

@Data
public class LoginDTO {

	private String email;
	private String password;
	private boolean useCookie;
	
}
