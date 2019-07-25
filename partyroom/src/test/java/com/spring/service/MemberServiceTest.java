package com.spring.service;

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
public class MemberServiceTest {

	@Setter(onMethod_ = {@Autowired})
	private MemberService service;

//	@Test
//	public void tesetRegister() {
//		
//		MemberVO member = new MemberVO();
//		
//		member.setEmail("gukbong2459@gmail.com");
//		member.setPassword("sdfsdf33");
//		member.setName("방국봉2");
//		
//		service.memberRegister(member);
//		
//		log.info("===============member : " + member);
//		
//	}
//	
//	@Test
//	public void testDelete() {
//		log.info("remove result : " + service.remove(9L));
//	}


//	@Test
//	public void memberLogin() {
//		MemberVO member = new MemberVO();
//		
//		member.setEmail("dd");
//		member.setPassword("dd");
//
//		log.info(member);
//		
//		service.login(member);
//	}
	
	@Test
	public void getSaltById() {
		MemberVO member = new MemberVO();
		
		member.setEmail("czcz");
		
		log.info(member);
		
		service.getSaltById(member.getEmail());
	}

}
