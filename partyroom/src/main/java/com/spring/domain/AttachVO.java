package com.spring.domain;

import lombok.Data;

@Data
public class AttachVO {

	private String uuid;
	private String uploadPath;
	private String filename;
	private boolean filetype;
	private Long bno;
	
}
