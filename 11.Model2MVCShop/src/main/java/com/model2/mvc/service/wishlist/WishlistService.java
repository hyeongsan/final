package com.model2.mvc.service.wishlist;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;


//==> ȸ���������� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
public interface WishlistService {
	
	// ȸ������
	public void addWishlist(Product product) throws Exception;
	
	
}