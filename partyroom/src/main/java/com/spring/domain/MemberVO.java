package com.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	private Long idx;
	private String email;
	private String password;
	private String name;
	private Date regdate;
	private int auth;
	private String salt;
}
