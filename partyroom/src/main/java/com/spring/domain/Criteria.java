package com.spring.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;


@Data
public class Criteria {

  private int pageNum;
  private int amount;
  
  private String type;
  private String keyword;

  public Criteria() {
    this(1, 10);
  }

  public Criteria(int pageNum, int amount) {
    this.pageNum = pageNum;
    this.amount = amount;
  }
  
  public String[] getTypeArr() {
    
    return type == null? new String[] {}: type.split("");
  }

  
  
  //여러 개의 파라미터를 연결해서 URL형태로 만들어주는 기능
  public String getListLink() {
	  UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
		  //필요한 파라미터 추가
		  .queryParam("pageNum", this.pageNum)
		  .queryParam("amount", this.getAmount())
		  .queryParam("type", this.getType())
		  .queryParam("keyword", this.getKeyword());
	return builder.toUriString();
  }





}
