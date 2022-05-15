package com.model2.mvc.service.wishlist;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;


//==> 회원관리에서 서비스할 내용 추상화/캡슐화한 Service  Interface Definition  
public interface WishlistService {
	
	// 회원가입
	public void addWishlist(Product product) throws Exception;
	
	
}