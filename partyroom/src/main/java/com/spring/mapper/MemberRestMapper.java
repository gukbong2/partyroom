package com.spring.mapper;

import com.spring.domain.MemberVO;

public interface MemberRestMapper {

	public MemberVO idCheck(String email);
	
	public MemberVO emailVerify(MemberVO member);

	
	
}
