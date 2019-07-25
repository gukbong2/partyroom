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
public class MemberRestMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private MemberRestMapper mapper;
	
	@Test
	public void testIdCheck() {
		String email = "junyeon2459@gmail.com";
		
		MemberVO vo = mapper.idCheck(email);
		
		log.info(vo);
	} 
	//정상적으로 작동
	
	
}
