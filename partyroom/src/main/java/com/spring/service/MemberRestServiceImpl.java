package com.spring.service;

import org.springframework.stereotype.Service;

import com.spring.domain.MemberVO;
import com.spring.mapper.MemberRestMapper;

import lombok.AllArgsConstructor;
@Service
@AllArgsConstructor
public class MemberRestServiceImpl implements MemberRestService {

	
	private MemberRestMapper mapper;
	
	@Override
	public MemberVO idCheck(String email) {
		return mapper.idCheck(email);
	}

}
