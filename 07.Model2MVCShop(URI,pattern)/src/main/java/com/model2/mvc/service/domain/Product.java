package com.model2.mvc.service.domain;

import java.sql.Date;


public class Product {
	
	private String fileName; //��ǰ�̹��� ����(image_file)
	private String manuDate; //��������(manufacture_day)
	private int price; //��ǰ����(price)
	private String prodDetail; //��ǰ������(prod_detail)
	private String prodName; //��ǰ��(prod_name)
	private int prodNo; //������ ��ǰ��ȣ(prod_no) -> seq_product_prod_no.nextval
	private Date regDate; //��ǰ�����(reg_date) -> sysdate�ϸ� �ɵ�
	private String proTranCode;
	private int view;
	
	public Product(){
	}
	
	public String getProTranCode() {
		return proTranCode;
	}
	public void setProTranCode(String proTranCode) {
		this.proTranCode = proTranCode;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getManuDate() {
		return manuDate;
	}
	public void setManuDate(String manuDate) {
		this.manuDate = manuDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProdDetail() {
		return prodDetail;
	}
	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}


	// Override
	public String toString() {
		return "Product : [fileName]" + fileName
				+ "[manuDate]" + manuDate+ "[price]" + price + "[prodDetail]" + prodDetail
				+ "[prodName]" + prodName + "[prodNo]" + prodNo+"[view]"+view;
	}	
}