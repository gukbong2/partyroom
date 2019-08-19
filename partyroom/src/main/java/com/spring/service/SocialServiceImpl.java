package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.SocialVO;
import com.spring.mapper.SocialMapper;

import lombok.Setter;

@Service
public class SocialServiceImpl implements SocialService {

	@Setter(onMethod_ = @Autowired)
	private SocialMapper mapper;

	
	@Override
	public void insert(SocialVO social) {
		mapper.insert(social);
	}

	@Override
	public boolean modify(SocialVO social) {
		// TODO Auto-generated method stub
		return mapper.update(social);
	}

	@Override
	public int count(SocialVO social) {
		// TODO Auto-generated method stub
		return mapper.count(social);
	}
}
