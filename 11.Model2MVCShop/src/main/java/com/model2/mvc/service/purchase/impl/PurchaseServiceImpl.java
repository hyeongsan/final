package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseDao;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.user.UserDao;;


//==> 회원관리 서비스 구현
@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService{
	
	///Field
	@Autowired
	@Qualifier("purchaseDaoImpl")
	private PurchaseDao purchaseDao;
	public void setPurchaseDao(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}
	
	///Constructor
	public PurchaseServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addPurchase(Purchase purchase) throws Exception {
		purchaseDao.addPurchase(purchase);
	}

	public Purchase getPurchase(int prodNo) throws Exception {
		return purchaseDao.getPurchase(prodNo);
	}

	public Map<String, Object> getPurchaseList(Search search, String userId) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search",search);
		map.put("userId",userId);
		
		List<Purchase> list= purchaseDao.getPurchaseList(map);	
		
		int totalCount = purchaseDao.getTotalCount(userId);
		
		map.put("list", list );		
		map.put("totalCount", new Integer(totalCount));
			
		return map;
		
		
	}

	public void updatePurchase(Purchase purchase) throws Exception {
		purchaseDao.updatePurchase(purchase);
	}

	public boolean checkDuplication(int prodNo) throws Exception {
		boolean result=true;
		Purchase purchase=purchaseDao.getPurchase(prodNo);
		if(purchase != null) {
			result=false;
		}
		return result;
	}
	
	public Purchase updateTranCode(Purchase purchase) throws Exception {
		return purchaseDao.updateTranCode(purchase);
	}
	
	public Purchase shipPurchase(int purchaseNo) throws Exception {
		return  purchaseDao.shipPurchase(purchaseNo);
	}
	
	public int MaxPurchase() throws Exception {
		return purchaseDao.MaxPurchase();
	}
	
	
	
}