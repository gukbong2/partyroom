package com.spring.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;

import com.spring.domain.Criteria;
import com.spring.domain.MemberVO;
import com.spring.domain.ReservVO;

public interface MemberService {

	public void memberRegister(MemberVO member) throws MessagingException, UnsupportedEncodingException;
	
	public boolean remove(Long idx);
	
	public MemberVO getMember(String member);
	
	public MemberVO login(MemberVO member);
	
	public String getSaltById(String email);

	public void updateAuthstatus(MemberVO member);

	public int getAuth(String email);

	public int modifyPassword(MemberVO member);

	public void updatePassword(MemberVO member);

	public void findPassword(MemberVO member) throws MessagingException, UnsupportedEncodingException;
	
	public void deleteMember(MemberVO member);

	public int phoneCheck(MemberVO member);

	public MemberVO getMemberByName(MemberVO member);

	
}
