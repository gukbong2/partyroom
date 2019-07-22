package com.spring.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTest {

	@Setter(onMethod_ = {@Autowired})
	private BoardService service;
	
//	@Test
//	public void testExist() {
//		log.info(service);
//		assertNotNull(service);
//	}
	
//	@Test
//	public void testRegister() {
//		BoardVO board = new BoardVO();
//		
//		board.setTitle("서비스 테스트 작성글");
//		board.setContent("서비스 테스트 작성내용");
//		board.setWriter("방국봉");
//		
//		service.register(board);
//		
//		log.info("생성된 게시물의 번호 : " + board.getBno());
//	}
	
//	@Test
//	public void testGetList() {
//		service.getList().forEach(board -> System.out.println(board));
//	}
	
//	@Test
//	public void testDelete() {
//		log.info("remove result : " + service.remove(1L));
//	}
	
//	@Test
//	public void testUpdate() {
//		BoardVO board = service.get(10L);
//		
//		if (board == null) {
//			return;
//		}
//		
//		board.setTitle("제목을 수정합니다.");	
//		log.info("modify result : " + service.modify(board));
//	}
	
	@Test
	public void testList() {
		service.getList(new Criteria(2, 10)).forEach(board -> log.info(board));
	}
	
	
	
}
