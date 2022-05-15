package com.model2.mvc.service.purchase;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;


//==> ȸ���������� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
public interface PurchaseService {
	
	// ȸ������
	public void addPurchase(Purchase purchase) throws Exception;
	
	// ������Ȯ�� / �α���
	public Purchase getPurchase(int productNo) throws Exception;
	
	// ȸ����������Ʈ 
	public Map<String , Object> getPurchaseList(Search search, String userId) throws Exception;
	
	// ȸ����������
	public void updatePurchase(Purchase purchase) throws Exception;
	
	// ȸ�� ID �ߺ� Ȯ��
	public boolean checkDuplication(int productNo) throws Exception;
	
	// Ʈ���ڵ� ������Ʈ
	public Purchase updateTranCode(Purchase purchase) throws Exception;
	
	public Purchase shipPurchase(int prouctNo) throws Exception ;
	
	public int MaxPurchase() throws Exception;
}