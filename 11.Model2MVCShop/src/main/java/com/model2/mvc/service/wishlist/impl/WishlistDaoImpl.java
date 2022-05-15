package com.model2.mvc.service.wishlist.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Wishlist;
import com.model2.mvc.service.wishlist.WishlistDao;


//==> 회원관리 DAO CRUD 구현
@Repository("wishlistDaoImpl")
public class WishlistDaoImpl implements WishlistDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public WishlistDaoImpl() {
	}

	///Method
	public void addWishlist(Product product) throws Exception {
		sqlSession.insert("WishlistMapper.addWishlist", product);
	}

}