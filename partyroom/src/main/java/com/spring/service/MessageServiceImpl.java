package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.MessageVO;
import com.spring.mapper.MessageMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
@Service
@AllArgsConstructor

public class MessageServiceImpl implements MessageService {

	@Setter(onMethod_ = @Autowired)
	private MessageMapper mapper;
	
	@Override
	public void insert(MessageVO message) {
		mapper.insert(message);
	}

	
	
}
