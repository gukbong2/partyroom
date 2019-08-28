package com.spring.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.MemberVO;
import com.spring.mapper.BoardMapper;
import com.spring.mapper.MemberMapper;
import com.spring.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MemberServiceImpl implements MemberService{

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper replyMapper;
	
	@Setter(onMethod_ = @Autowired)
	private JavaMailSender mailSender;
	
	@Override
	@Transactional
	public void memberRegister(MemberVO member) throws MessagingException, UnsupportedEncodingException {
		// 임의의 authkey 생성
		String authkey = new TempKey().getKey(20, false);
		String sendEmail = "sspartyroom@gmail.com";
		sendEmail.trim();
		
		member.setAuthkey(authkey);
		
		log.info("서비스 authkey : " + authkey);
		
		mapper.updateAuthkey(member);
		
		// mail 작성 관련 
		MailUtils sendMail = new MailUtils(mailSender);

		sendMail.setSubject("[ 더블에스 파티룸 ] 회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				.append("<a href='http://localhost:8080/member/emailAuth?email=")
				.append(member.getEmail())
				.append("&authkey=")
				.append(authkey)
				.append("&target='_blank'>이메일 인증 확인</a>")
				.toString());
		sendMail.setFrom(sendEmail, sendEmail);
		sendMail.setTo(member.getEmail());
		sendMail.send();
		
		mapper.insertSelectKey(member);
	}

	@Override
	public boolean remove(Long idx) {
		return mapper.remove(idx) == 1;
	}

	@Override
	public MemberVO getMember(String email) {
		// TODO Auto-generated method stub
		return mapper.getMember(email);
	}

	@Override
	public MemberVO login(MemberVO member) {
		
		return mapper.login(member);
	}

	@Override
	public String getSaltById(String email) {
		// TODO Auto-generated method stub
		return mapper.getSaltById(email);
	}

	@Override
	public void updateAuthstatus(MemberVO member) {
		// TODO Auto-generated method stub
		mapper.updateAuthstatus(member);
	}

	@Override
	public int getAuth(String email) {
		return mapper.getAuth(email);
	}

	@Override
	public int modifyPassword(MemberVO member) {
		return mapper.modifyPassword(member);
	}

	@Override
	public void updatePassword(MemberVO member) {
		mapper.updatePassword(member);
	}

	@Transactional
	@Override
	public void findPassword(MemberVO member) throws MessagingException, UnsupportedEncodingException {
		String sendEmail = "sspartyroom@gmail.com";
		
		String authkey = new TempKey().getKey(40, false);

		member.setAuthkey(authkey);
		mapper.updateAuthkey(member);
		
		// mail 작성 관련 
		MailUtils sendMail = new MailUtils(mailSender);

		sendMail.setSubject("[ 더블에스 파티룸 ] 비밀번호 찾기 메일입니다.");
		sendMail.setText(new StringBuffer().append("<h1>[비밀번호 변경]</h1>")
				.append("<p>아래 링크를 클릭하시면 비밀번호 변경 페이지로 이동하게 됩니다.</p>")
				.append("<a href='http://localhost:8080/member/findPwEmailAuth?email=")
				.append(member.getEmail())
				.append("&authkey=")
				.append(authkey)
				.append("' target='_blank'>비밀번호 변경</a>")
				.toString());
		sendMail.setFrom(sendEmail, "더블에스파티룸");
		sendMail.setTo(member.getEmail());
		sendMail.send();
		
	}
	
	@Override
	public void deleteMember(MemberVO member) {
		mapper.deleteMember(member);
	}

	@Override
	public int phoneCheck(MemberVO member) {
		return mapper.phoneCheck(member);
	}

	@Override
	public MemberVO getMemberByName(MemberVO member) {
		// TODO Auto-generated method stub
		return mapper.getMemberByName(member);
	}

	

	

	
	
	
	
	
}
