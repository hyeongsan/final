package com.model2.mvc.service.domain;

public class Wishlist {
	
	//Field
	private int prodNo;
	private Product product;
	
	
	public Wishlist(){
	}

	///Method 
	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	
	
}
