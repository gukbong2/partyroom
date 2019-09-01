package com.spring.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.AttachVO;
import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.domain.MemberVO;
import com.spring.domain.PageDTO;
import com.spring.service.BoardService;
import com.spring.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;



@Controller
@RequestMapping("/board/*")
@Log4j
@AllArgsConstructor // 또는 BoardService 에 @Setter(onMethod_ = ({@AutoWired})
public class BoardController {

	private BoardService service;
	private MemberService memberService;
	
	@GetMapping("/faq")
	public void faq(Criteria cri, Model model, HttpSession session) {
		
	}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model, HttpSession session) {

		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);

		session.getAttribute("url");
		
		log.info("total: " + total);

		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}
	
	@GetMapping("/register")
	public String boardRegister() {
		return "board/register";	
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		
		log.info("register : " + board);
		
		if(board.getAttachList() != null) {
			log.info("==============================Attach================================");
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		
		log.info("==============================");
		
		service.register(board);
		
		rttr.addFlashAttribute("result", board.getBno());
		
		
		return "redirect:/board/list";
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, Model model, HttpSession session, @ModelAttribute("cri") Criteria cri) {
		//ModelAttribute = 자동으로 Model에 데이터를 지정한 이름으로 담아줌
		log.info("/get AND /modify");
		session.getAttribute("member");
		session.setAttribute("board", service.get(bno));
	}

	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, HttpSession session) {
		log.info("modify:" + board);
		
		MemberVO member = new MemberVO();
		member.setName(board.getWriter());
		member.setEmail(board.getEmail());
		
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
			memberService.getMemberByName(member);
		}
		session.setAttribute("member", member);
		session.setAttribute("boardName", board.getWriter());
		log.warn("========================");
		log.warn("========================");
		log.info("member : " + session.getAttribute("member"));
		log.warn("========================");
		log.warn("========================");
		return "redirect:/board/list" + cri.getListLink();
	}
	//cri.getListLink() = 파라미터 연결해서 URL 형태로 만들어줌
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {

		log.info("remove..." + bno);

		List<AttachVO> attachList = service.getAttachList(bno);

		if (service.remove(bno)) {

			// delete Attach Files
			deleteFiles(attachList);

			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list" + cri.getListLink();
	}

	
	
	@ResponseBody
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachVO>> getAttachList(Long bno) {
		log.info("=====================================================");
		log.info("=====================================================");
		log.info("getAttachList : " + bno);
		log.info("=====================================================");
		log.info("=====================================================");
		
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
	
	private void deleteFiles(List<AttachVO> attachList) {
		    
		    if(attachList == null || attachList.size() == 0) {
		      return;
		    }
		    
		    log.info("delete attach files...................");
		    log.info(attachList);
		    
		    attachList.forEach(attach -> {
		      try {        
		    	  Path file  = Paths.get("D:\\upload\\"+attach.getUploadPath()+"\\" + attach.getUuid()+"_"+ attach.getFilename());
		        
		        	Files.deleteIfExists(file);
		        
		        if (Files.probeContentType(file).startsWith("image")) {
		        
		          Path thumbNail = Paths.get("D:\\upload\\"+attach.getUploadPath()+"\\s_" + attach.getUuid()+"_"+ attach.getFilename());
		          
		          Files.delete(thumbNail);
		        }
		
		      } catch(Exception e) {
		        log.error("delete file error" + e.getMessage());
		      } 
		    
		    }); 
		    
		  }
	
	

}
