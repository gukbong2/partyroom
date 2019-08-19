package com.spring.service;

import com.spring.domain.SocialVO;

public interface SocialService {

	public void insert(SocialVO social);
	
	public boolean modify(SocialVO social);
	
	public int count(SocialVO social);
	
}


