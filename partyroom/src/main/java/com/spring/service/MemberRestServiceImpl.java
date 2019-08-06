package com.spring.service;

import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.MemberVO;
import com.spring.mapper.BoardMapper;
import com.spring.mapper.MemberMapper;
import com.spring.mapper.MemberRestMapper;
import com.spring.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
@Service
@AllArgsConstructor
public class MemberRestServiceImpl implements MemberRestService {

	
	private MemberRestMapper memberRestMapper;
	private MemberMapper memberMapper;
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper replyMapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
	@Override
	public MemberVO idCheck(String email) {
		return memberRestMapper.idCheck(email);
	}

	@Override
	public MemberVO emailVerify(MemberVO member) {
		
		return memberRestMapper.emailVerify(member);
	}
	
	@Transactional
	@Override
	public int remove(String email) {
		return memberRestMapper.delete(email);
	}

	@Override
	public MemberVO phoneCheck(String phone) {
		// TODO Auto-generated method stub
		return memberRestMapper.phoneCheck(phone);
	}

	
	

	

	

	

	

}
