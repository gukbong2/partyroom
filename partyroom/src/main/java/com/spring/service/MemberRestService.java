package com.spring.service;

import com.spring.domain.MemberVO;

public interface MemberRestService {
	
	public MemberVO idCheck(String email);

	public MemberVO emailVerify(MemberVO member);

}
