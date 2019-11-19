package kr.co.doublecome.repository.vo;

import lombok.Data;

@Data
public class Category {
	private int categoryCode;				// 카테고리 번호
	private String categoryName;			// 카테고리 이름
	private String categoryIcon;			// 카테고리 아이콘
}
