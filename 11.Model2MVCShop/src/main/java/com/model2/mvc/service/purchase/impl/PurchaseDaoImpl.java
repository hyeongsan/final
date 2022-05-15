package com.model2.mvc.service.purchase.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.purchase.PurchaseDao;
import com.model2.mvc.service.user.UserDao;


//==> 회원관리 DAO CRUD 구현
@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurchaseDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public PurchaseDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addPurchase(Purchase purchase) throws Exception {
		System.out.println("test");
		sqlSession.insert("PurchaseMapper.addPurchase", purchase);
		
	}

	public Purchase getPurchase(int purchaseNo) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getPurchase", purchaseNo);
	}
	
	public void updatePurchase(Purchase purchase) throws Exception {
		sqlSession.update("PurchaseMapper.updatePurchase", purchase);
	}

	public List<Purchase> getPurchaseList(Map<String,Object> map ) throws Exception{

		return sqlSession.selectList("PurchaseMapper.getPurchaseList",map );

	}
	
	public int getTotalCount(String userId) throws Exception {
		
		return sqlSession.selectOne("PurchaseMapper.getTotalCount", userId);
	}
	
	public Purchase updateTranCode(Purchase purchase) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.updateTranCode", purchase);
	}
	
	public Purchase shipPurchase(int purchaseNo) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.shipPurchase", purchaseNo);
	}
	
	public int MaxPurchase() throws Exception {
		return sqlSession.insert("PurchaseMapper.maxPurchase");
	}
	

}