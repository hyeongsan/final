package com.model2.mvc.service.wishlist;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;


//==> ȸ���������� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition
public interface WishlistDao {
	
	// INSERT
	public void addWishlist(Product product) throws Exception ;
		
}