package com.spring.service;

import com.spring.domain.MemberVO;

public interface MemberService {

	public void memberRegister(MemberVO member);
	
	public boolean remove(Long idx);
	
	public MemberVO getMember(Long idx);
	
	public MemberVO login(MemberVO member);
	
	public String getSaltById(String email);
}
