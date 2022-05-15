package com.model2.mvc.service.wishlist.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserDao;
import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.wishlist.WishlistDao;
import com.model2.mvc.service.wishlist.WishlistService;


//==> ȸ���������� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
@Service("wishlistServiceImpl")
public class WishlistServiceImpl implements WishlistService{
	@Autowired
	@Qualifier("wishlistDaoImpl")
	private WishlistDao wishlistDao;
	public void setWishlistDao(WishlistDao wishlistDao) {
		this.wishlistDao = wishlistDao;
	}
	
	
	///Constructor
	public WishlistServiceImpl() {
		System.out.println(this.getClass());
	}
	
	
	// ȸ������
	public void addWishlist(Product product) throws Exception {
		wishlistDao.addWishlist(product);
	}
	
}