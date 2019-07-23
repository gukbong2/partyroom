package com.spring.mapper;

import com.spring.domain.MemberVO;

public interface MemberMapper {

	public MemberVO login(MemberVO member);
	
	public void insert(MemberVO member);
	
	public void insertSelectKey(MemberVO member);
	
	public int delete(Long idx);
	
	public MemberVO getMember(Long idx);
	
	
	
}
