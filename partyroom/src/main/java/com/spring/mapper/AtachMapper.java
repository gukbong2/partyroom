package com.spring.mapper;

import java.util.List;

import com.spring.domain.AttachVO;

public interface AtachMapper {

	public void insert(AttachVO attach);
	
	public void delete(String uuid);
	
	public List<AttachVO> findByBno(Long bno);
	
}
