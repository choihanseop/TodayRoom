package kosta.todayroom.domain;

import lombok.Data;

@Data
public class ProductAttachVO {
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean image;
	  
	private int store_seq;

}
