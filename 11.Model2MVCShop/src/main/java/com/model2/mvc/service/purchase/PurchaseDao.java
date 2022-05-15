package com.model2.mvc.service.purchase;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;


//==> ȸ���������� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition
public interface PurchaseDao {
	
	// INSERT
	public void addPurchase(Purchase purchase) throws Exception ;

	// SELECT ONE
	public Purchase getPurchase(int prouctNo) throws Exception ;

	// SELECT LIST
	public List <Purchase> getPurchaseList(Map<String,Object> map ) throws Exception;

	// UPDATE
	public void updatePurchase(Purchase purchase) throws Exception ;
	
	// �Խ��� Page ó���� ���� ��üRow(totalCount)  return
	public int getTotalCount(String userId) throws Exception; 
	
	//Ʈ���ڵ� ������Ʈ
	public Purchase updateTranCode(Purchase purchase) throws Exception ;
	
	//Ʈ���ڵ� ������Ʈ
	public Purchase shipPurchase(int prouctNo) throws Exception ;
	
	public int MaxPurchase() throws Exception ;
}