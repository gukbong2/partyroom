package com.spring.mapper;

import com.spring.domain.MessageVO;

//1. 랜덤 인증번호가 날라가면 테이블에 값이 들어가는게 1번
//2. 
public interface MessageMapper {

	public void insert(MessageVO message);
	
}
