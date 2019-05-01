package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductDaoImpl;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;
import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.user.impl.UserDaoImpl;


//==> 회원관리 Controller
@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현 않음
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
		
	public PurchaseController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping(value="addPurchase", method=RequestMethod.GET)
	public String addPurchaseView(HttpServletRequest request, HttpSession session, Model model) throws Exception {

		System.out.println("==============================");
		System.out.println("AddPurchaseViewAction - START"); 
		
		Product product = null;
		
		int prodNo = Integer.parseInt(request.getParameter("prod_no"));
		System.out.println("AddPurchaseViewAction - prodNo : "+prodNo);
		
		product = productService.getProduct(prodNo);
		
		System.out.println(product);
		
		model.addAttribute("product", product);
		model.addAttribute("user", session.getAttribute("user"));
		
		System.out.println("AddPurchaseViewAction - END"); 
		
		return "forward:/purchase/addPurchaseView.jsp";
	}
	
	@RequestMapping(value="addPurchase", method=RequestMethod.POST)
	public String addPurchase(@ModelAttribute("purchase") Purchase purchase, HttpServletRequest request, Model model) throws Exception {
		
		System.out.println("==============================");
		System.out.println("AddPurchaseAction - START"); 
		
		purchase.setTranCode("1");//tranCode가 null이면 판매중, "1"이면 판매완료, "2"면 배송시작, "3"이면 배송완료로 설정하겠다.
		//orderDate도 현재 날짜를 입력해야하는 것이므로, 사용자로부터 입력받지않고 DB에 입력할때 sysdate으로 넣는다.
		purchase.setBuyer(userService.getUser(request.getParameter("buyerId")));
		purchase.setPurchaseProd(productService.getProduct(Integer.parseInt(request.getParameter("prodNo"))));
		
		System.out.println("AddPurchaseAction - purchaseVO : "+purchase);
		
		purchaseService.addPurchase(purchase);
		
		System.out.println("addPurchase : "+purchaseService.getPurchase2(purchase.getPurchaseProd().getProdNo()));
		
		model.addAttribute("purchase", purchaseService.getPurchase2(purchase.getPurchaseProd().getProdNo()));
		
		System.out.println("AddPurchaseAction - END"); 
		
		return "forward:/purchase/addPurchase.jsp";
		
	}
	
	@RequestMapping(value="getPurchase")
	public String getPurchase( HttpServletRequest request , Model model ) throws Exception {
		
		System.out.println("==============================");
		System.out.println("GetPurchaseAction - START"); 
		
		
		int tranNo = Integer.parseInt(request.getParameter("tranNo"));
		
		Purchase purchase = purchaseService.getPurchase(tranNo);
		System.out.println(purchase);
		
		model.addAttribute("purchase", purchase);
		
		if (request.getParameter("update") != null) {
			model.addAttribute("update", "update");
		}
		
		System.out.println("GetPurchaseAction - END"); 
				
		return "forward:/purchase/getPurchase.jsp";
	}
	
	@RequestMapping(value="updatePurchase", method=RequestMethod.GET)
	public String updatePurchaseView(HttpServletRequest request, Model model ) throws Exception{

		System.out.println("==============================");
		System.out.println("UpdatePurchaseViewAction - START"); 
		
		int tranNo = Integer.parseInt(request.getParameter("tranNo"));

		Purchase purchase = purchaseService.getPurchase(tranNo);
		
		System.out.println(purchase);
		
		model.addAttribute("purchase", purchase);
		
		System.out.println("UpdatePurchaseViewAction - END");
		
		//return returnPage;
		return "forward:/purchase/updatePurchaseView.jsp";
	}
	
	@RequestMapping(value="updatePurchase", method=RequestMethod.POST)
	public String updatePurchase( HttpServletRequest request , Model model ) throws Exception{

		System.out.println("==============================");
		System.out.println("UpdatePurchaseAction - START"); 
		
		
		ProductDao productDAO = new ProductDaoImpl();
//		Purchase purchase = new Purchase();
//		
//		if (request.getParameter("prodNo") != null) {
//			purchase.setPurchaseProd(productService.getProduct(Integer.parseInt(request.getParameter("prodNo"))));
//		}else if(request.getParameter("tranNo") != null){
//			purchase.setPurchaseProd(productDAO.findProduct(Integer.parseInt(request.getParameter("tranNo"))));
//		}

		Purchase purchase = null;
//		if (request.getParameter("prodNo") != null) {
//			purchase = purchaseService.getPurchase2(Integer.parseInt(request.getParameter("prodNo")));
//		}else 
		if(request.getParameter("tranNo") != null){
			purchase = purchaseService.getPurchase(Integer.parseInt(request.getParameter("tranNo")));
		}
//		purchase.setTranNo(Integer.parseInt(request.getParameter("tranNo")));
		purchase.setPaymentOption(request.getParameter("paymentOption"));
		purchase.setReceiverName(request.getParameter("receiverName"));
		purchase.setReceiverPhone(request.getParameter("receiverPhone"));
		purchase.setDivyAddr(request.getParameter("receiverAddr"));
		purchase.setDivyRequest(request.getParameter("receiverRequest"));

		System.out.println("UpdatePurchaseAction - "+purchase);
		
		purchaseService.updatePurchase(purchase);
		
		System.out.println("UpdatePurchaseAction - END"); 
		
		return "forward:/purchase/getPurchase?update=update&tranNo="+purchase.getTranNo();
	}
	
	@RequestMapping(value="updateTranCode")
	public String updateTranCode(HttpServletRequest request) throws Exception{
		
		System.out.println("==============================");
		System.out.println("UpdateTranCodeAction - START"); 
		
		String currentPage = request.getParameter("page");
		Purchase purchase = purchaseService.getPurchase2(Integer.parseInt(request.getParameter("prodNo")));
		purchase.setTranCode(request.getParameter("tranCode"));
		
		System.out.println("UpdateTranCodeByProdAction - purchase : "+purchase);
		
		purchaseService.updateTranCode(purchase);
		
		System.out.println("UpdateTranCodeAction - END"); 
		
		return "forward:/purchase/listPurchase?page="+currentPage;
		//return "forward:/purchase/getPurchase.do?tranNo="+purchase.getTranNo();
	}
	
	@RequestMapping(value="updateTranCodeByProd")
	public String updateTranCodeByProd(HttpServletRequest request, Model model) throws Exception{
		
		System.out.println("==============================");
		System.out.println("UpdateTranCodeByProdAction - START"); 
		
		String currentPage = request.getParameter("page");
		Purchase purchase = purchaseService.getPurchase2(Integer.parseInt(request.getParameter("prodNo")));
		purchase.setTranCode(request.getParameter("tranCode"));
		
		System.out.println("UpdateTranCodeByProdAction - purchase : "+purchase);
		
		purchaseService.updateTranCode(purchase);
		
		System.out.println("UpdateTranCodeByProdAction - END"); 
		
		return "forward:/purchase/listProduct?page="+currentPage+"&menu=manage";
		//return "forward:/purchase/getPurchase.do?tranNo="+purchase.getTranNo();
	}
	
	@RequestMapping(value="cancelPurchase")
	public String cancelPurchase(HttpServletRequest request, Model model) throws Exception{
		
		System.out.println("==============================");
		System.out.println("CancelPurchaseAction - START"); 
		
		int tranNo = 0;
		
		if(request.getParameter("tranNo") != null){
			//purchase.setTranNo((Integer.parseInt(request.getParameter("tranNo"))));
			tranNo = Integer.parseInt(request.getParameter("tranNo"));
			
			//System.out.println("CancelPurchaseAction - "+purchase);
			System.out.println("CancelPurchaseAction - "+tranNo);
			
			purchaseService.cancelPurchase(tranNo);
		}		
		
		System.out.println("CancelPurchaseAction - END"); 
		
		return "forward:/purchase/listPurchase";
	}
	
	@RequestMapping(value="listPurchase")
	public String listPurchase( @ModelAttribute("search") Search search , Model model ,HttpSession session ) throws Exception{
		
		System.out.println("==============================");
		System.out.println("ListPurchaseAction - START"); 
			
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		String buyerId = ((User)session.getAttribute("user")).getUserId();
		search.setSearchKeyword(buyerId);
		search.setSearchCondition("2");
		//total 세기 위해...
		
		Map<String,Object> map = purchaseService. getPurchaseList(search,buyerId);
		
		Page resultPage	= 
				new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("ListPurchaseAction ::"+resultPage);

		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		System.out.println("ListPurchaseAction - END"); 
		
		return "forward:/purchase/listPurchase.jsp";
	}
}