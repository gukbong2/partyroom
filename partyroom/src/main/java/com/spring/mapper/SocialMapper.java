package com.spring.mapper;

import com.spring.domain.SocialVO;

public interface SocialMapper {

	public void insert(SocialVO social);

	
	public int count(SocialVO social);

	public boolean update(SocialVO social);
	
	
}
