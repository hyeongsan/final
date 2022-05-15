package com.model2.mvc.service.wishlist;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;


//==> 회원관리에서 CRUD 추상화/캡슐화한 DAO Interface Definition
public interface WishlistDao {
	
	// INSERT
	public void addWishlist(Product product) throws Exception ;
		
}