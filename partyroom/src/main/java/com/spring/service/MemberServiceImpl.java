package com.spring.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.MemberVO;
import com.spring.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private JavaMailSender mailSender;
	
	@Override
	@Transactional
	public void memberRegister(MemberVO member) throws MessagingException, UnsupportedEncodingException {
		
		
		// 임의의 authkey 생성
		String authkey = new TempKey().getKey(50, false);

		member.setAuthkey(authkey);
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
				.append("' target='_blenk'>이메일 인증 확인</a>")
				.toString());
		sendMail.setFrom("sspartyroom@gmail.com ", "sspartyroom@gmail.com");
		sendMail.setTo(member.getEmail());
		sendMail.send();
		
		mapper.insertSelectKey(member);
	}

	@Override
	public boolean remove(Long idx) {
		return mapper.delete(idx) == 1;
	}

	@Override
	public MemberVO getMember(Long idx) {
		// TODO Auto-generated method stub
		return mapper.getMember(idx);
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

	
	
	
	
	
}
