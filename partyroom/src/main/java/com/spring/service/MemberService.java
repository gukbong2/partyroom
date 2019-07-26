package com.spring.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import com.spring.domain.MemberVO;

public interface MemberService {

	public void memberRegister(MemberVO member) throws MessagingException, UnsupportedEncodingException;
	
	public boolean remove(Long idx);
	
	public MemberVO getMember(Long idx);
	
	public MemberVO login(MemberVO member);
	
	public String getSaltById(String email);

	public void updateAuthstatus(MemberVO member);

}
