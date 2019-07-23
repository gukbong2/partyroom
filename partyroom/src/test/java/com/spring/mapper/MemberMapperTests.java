package com.spring.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {
	
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper mapper;
	
//	@Test
//	public void testRegister() {
//		MemberVO member = new MemberVO();
//		
//		member.setEmail("junyeon2@gmail.com");
//		member.setPassword("a4134145");
//		member.setName("방국봉");
//		
//		log.info(member);
//		
//		mapper.insertSelectKey(member);
//	}
//	
//	@Test
//	public void testDelete() {
//		log.info("========DELETE COUNT : " + mapper.delete(5L));
//	}
	
}
