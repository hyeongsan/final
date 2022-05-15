package com.model2.mvc.service.product;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;


//==> ȸ���������� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
public interface ProductService {
	
	// ȸ������
	public void addProduct(Product product) throws Exception;
	
	// ������Ȯ�� / �α���
	public Product getProduct(int productNo) throws Exception;
	
	// ȸ����������Ʈ 
	public Map<String , Object> getProductList(Search search) throws Exception;
	
	// ȸ����������
	public void updateProduct(Product product) throws Exception;
	
	// ȸ�� ID �ߺ� Ȯ��
	public boolean checkDuplication(int productNo) throws Exception;
	
	// ȸ�� ID �ߺ� Ȯ��
	public int MaxProduct() throws Exception;
	
}