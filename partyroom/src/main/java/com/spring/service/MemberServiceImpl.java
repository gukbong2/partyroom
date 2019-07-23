package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.MemberVO;
import com.spring.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	@Override
	public void memberRegister(MemberVO member) {
		mapper.insertSelectKey(member);
	}

	@Override
	public boolean remove(Long idx) {
		return mapper.delete(idx) == 1;
	}

	@Override
	public MemberVO getMember(Long idx) {
		// TODO Auto-generated method stub
		return mapper.getMember(idx);
	}

	@Override
	public MemberVO login(MemberVO member) {
		
		return mapper.login(member);
	}
	
	
	
	
	
}
