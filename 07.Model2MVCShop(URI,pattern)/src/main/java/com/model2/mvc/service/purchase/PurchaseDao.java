package com.model2.mvc.service.purchase;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;


//==> ȸ���������� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition
public interface PurchaseDao {
	
	// INSERT
	public void insertPurchase(Purchase purchase) throws Exception ;

	// SELECT ONE
	public Purchase getPurchase(int no) throws Exception;
	
	public Purchase getPurchase2(int prodNo) throws Exception;

	// SELECT LIST
	public  List<Product> getSaleList(Search search) throws Exception;

	public  List<Product> getPurchaseList(Search search,String buyerId) throws Exception;
	
	// UPDATE
	public void updatePurchase(Purchase purchase) throws Exception;
	
	public void updateTranCode(Purchase purchase) throws Exception;
	
	//DELETE
	public void deletePurchase(int tranNo) throws Exception ;
	
	// �Խ��� Page ó���� ���� ��üRow(totalCount)  return
	public int getTotalCount(Search search) throws Exception;
	
	
}