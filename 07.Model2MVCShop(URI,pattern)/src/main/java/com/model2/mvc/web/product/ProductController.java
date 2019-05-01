package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.common.util.CommonUtil;
import com.model2.mvc.common.util.ConvertKo;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;


//==> 회원관리 Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	
	public ProductController(){
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
	
	
	@RequestMapping(value="addProduct")
	public String addProduct(HttpServletRequest request, Model model) throws Exception {

		System.out.println("==============================");
		System.out.println("AddProductAction - START"); 
		
		
		Product product = new Product();
		product.setProdName(CommonUtil.null2str(request.getParameter("prodName")));
		product.setProdDetail(CommonUtil.null2str(request.getParameter("prodDetail")));
		
		String[] manuDateArray = request.getParameter("manuDate").split("-");
		String manuDate = "";
		for (int i = 0; i < manuDateArray.length; i++) {
			manuDate += manuDateArray[i];
		}
		product.setManuDate(manuDate);
		
		product.setPrice(Integer.parseInt(request.getParameter("price")));
		product.setFileName(CommonUtil.null2str(request.getParameter("fileName")));
		
		System.out.println(product);
		
		productService.addProduct(product);
		
		model.addAttribute("product", product);

		System.out.println("AddProductAction - END"); 
		
		return "forward:/product/addProduct.jsp";
	}
	
	@RequestMapping(value="getProduct")
	public String getProduct( HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		System.out.println("==============================");
		System.out.println("GetProductAction - START"); 
		
		int prodNo = Integer.parseInt(request.getParameter("prodNo"));
		System.out.println("prodNo : "+prodNo);
		
		Product product = productService.getProduct(prodNo);
		product.setView(product.getView()+1);
		productService.updateViewProduct(product);

//		Purchase purchase = purchaseService.getPurchase2(prodNo);
//		
//		if (purchase != null) {
//			product.setProTranCode(purchase.getTranCode());
//		}
//		
		System.out.println(product);
		
		model.addAttribute("product", product);
		model.addAttribute("menu", request.getParameter("menu"));
		System.out.println( request.getParameter("menu"));
		
		///////////////COOKIE////////////////
		
		//response.setCharacterEncoding("euc-kr");
		
		String history = null;
		
		Cookie[] cookies = request.getCookies();
		
		if (cookies!=null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				if (cookie.getName().equals("history")) {
					history = cookie.getValue();
				}
			}
			if (history != null) {
				String[] h = history.split(",");
				for (int i = 0; i < h.length; i++) {
					if (h[i].equals(request.getParameter("prodNo"))) {
						break;
						}
					if (i==h.length-1) {
						history += request.getParameter("prodNo")+",";
					}
				}
			}
		}
		
		Cookie cookie = new Cookie("history",history);
		cookie.setMaxAge(-1);
		response.addCookie(cookie);
		
		System.out.println("GetProductAction - END"); 
		return "forward:/product/getProduct.jsp";
	}
	
	@RequestMapping(value="updateProduct", method=RequestMethod.GET)
	public String updateProductView(HttpServletRequest request, Model model) throws Exception{

		System.out.println("==============================");
		System.out.println("UpdateProductViewAction - START"); 
		
		int prodNo = Integer.parseInt(request.getParameter("prodNo"));
		
		Product product = productService.getProduct(prodNo);
		
		model.addAttribute("product", product);
		
		System.out.println("UpdateProductViewAction - END"); 
		
		return "forward:/product/updateProductView.jsp";
	}
	
	@RequestMapping(value="updateProduct", method=RequestMethod.POST)
	public String updateProduct(HttpServletRequest request, Model model) throws Exception{

		System.out.println("==============================");
		System.out.println("UpdateProductAction - START"); 
		
		int prodNo = Integer.parseInt(request.getParameter("prodNo"));
		
		Product product = new Product();
		
		product.setProdNo(prodNo);
		product.setProdName(request.getParameter("prodName"));
		product.setProdDetail(request.getParameter("prodDetail"));
		
		String[] manuDateArray = request.getParameter("manuDate").split("-");
		String manuDate = "";
		for (int i = 0; i < manuDateArray.length; i++) {
			manuDate += manuDateArray[i];
		}
		
		product.setManuDate(manuDate);
		product.setPrice(Integer.parseInt(request.getParameter("price")));
		product.setFileName(request.getParameter("fileName"));
		
		productService.updateProduct(product);
		
		System.out.println("UpdateProductAction - END"); 
		
		return "forward:/product/getProduct?menu=manage&prodNo="+prodNo;
	}
	
	@RequestMapping(value="listProduct")
	public String listProduct( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("==============================");
		System.out.println("ListProductAction - START"); 
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		search.setSearchCondition(CommonUtil.null2str(request.getParameter("searchCondition")));
		
		String searchKeyword = CommonUtil.null2str(request.getParameter("searchKeyword"));
		
		if (request.getMethod().equals("GET") &&  searchKeyword != "" ) {
			searchKeyword = ConvertKo.convertKo(request.getParameter("searchKeyword"));
		}
		
		search.setSearchKeyword(searchKeyword);
		search.setAscendingCondition(request.getParameter("ascendingCondition"));
		search.setOnSale(request.getParameter("onSale"));
		
		if (request.getParameter("lowPrice") != null) {
			search.setLowPrice(Integer.parseInt(request.getParameter("lowPrice")));
		}
		if (request.getParameter("highPrice") != null) {
			search.setHighPrice(Integer.parseInt(request.getParameter("highPrice")));
		}

		Map<String,Object> map = productService.getProductList(search);
		System.out.println("ListProductAction - "+search);
		
		Page resultPage	= 
				new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("ListProductAction ::"+resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		System.out.println("ListProductAction - END"); 
		
		return "forward:/product/listProduct.jsp";
	}
}