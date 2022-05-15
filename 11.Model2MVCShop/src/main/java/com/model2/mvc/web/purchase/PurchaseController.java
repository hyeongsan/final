package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;




@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	

	
	//setter Method 구현 않음

public PurchaseController() {
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

//@RequestMapping("/addPurchaseView.do")
@RequestMapping( value="addPurchaseView", method=RequestMethod.GET )
public ModelAndView addPurchaseView(@ModelAttribute("purchase") Purchase purchase, @ModelAttribute("product") Product product, @ModelAttribute("user") User user, HttpSession session) throws Exception {

	System.out.println("/addPurchaseView.do");
		
	int prodNo = product.getProdNo();
	System.out.println(product);
	
	Product product1 = productService.getProduct(prodNo);
	
	System.out.println("hyeongsan");
	
	//String sessionId=((User)session.getAttribute("user")).getUserId();
	User sessionUser = (User)session.getAttribute("user");
//	String sessionId = sessionUser.getUserId();
	
	System.out.println(sessionUser);	
		
	ModelAndView modelAndView = new ModelAndView();
	modelAndView.addObject("purchase", purchase);
	modelAndView.addObject("product", product1);
	modelAndView.addObject("user", sessionUser);
		
	modelAndView.setViewName("forward:/purchase/addPurchaseView.jsp");
	
	
	return modelAndView;
}


//@RequestMapping("/addPurchase.do")
@RequestMapping( value="addPurchase", method=RequestMethod.POST )
public ModelAndView addPurchase(@ModelAttribute("purchase") Purchase purchase,@ModelAttribute("product") Product product ,@ModelAttribute("user") User user,HttpSession session )throws Exception {

	System.out.println("/addPurchase.do");


	int prodNo = product.getProdNo();
	
	System.out.println(user);
	
		
	Product product1 = productService.getProduct(prodNo);	
	String sessionId=((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}		
	
	purchase.setPurchaseProd(product);
	purchase.setBuyer(user);
	
	//transcode 처리
	if(purchase.getPurchaseProd().getProTranCode()==null) {
		purchase.getPurchaseProd().setProTranCode("100");		
	}else if(purchase.getPurchaseProd().getProTranCode()=="100") {
		purchase.getPurchaseProd().setProTranCode("200");	
	}else if(purchase.getPurchaseProd().getProTranCode()=="200") {
		purchase.getPurchaseProd().setProTranCode("300");
		purchase.setTranCode("300");
	}	
	
	purchase.setTranCode(purchase.getPurchaseProd().getProTranCode());
	
	////
//	int maxNum =purchaseService.MaxPurchase();
//		
//	purchase.setTranNo(maxNum);
	System.out.println("san"+purchase);
	System.out.println("san"+product);
	
	purchaseService.addPurchase(purchase);
		
	
	ModelAndView modelAndView = new ModelAndView();
	modelAndView.addObject("purchase", purchase);
	modelAndView.addObject("product", product1);
	modelAndView.addObject("user", user);
	
	modelAndView.setViewName("forward:/purchase/getPurchaseView.jsp");
	
	return modelAndView;
}

//@RequestMapping("/listPurchase.do")
@RequestMapping( value="listPurchase" )
public String listProduct( @ModelAttribute("search") Search search , Model model , HttpServletRequest request,HttpSession session ) throws Exception{
	
	System.out.println("/listPurchase.do");
	
	if(search.getCurrentPage() ==0 ){
		search.setCurrentPage(1);
	}
	search.setPageSize(pageSize);
	
	String sessionId=((User)session.getAttribute("user")).getUserId();
	
	// Business logic 수행
	Map<String , Object> map = purchaseService.getPurchaseList(search,sessionId);
	
	Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
	System.out.println(resultPage);
	
	
	
	
	
	// Model 과 View 연결
	model.addAttribute("list", map.get("list"));
	model.addAttribute("resultPage", resultPage);
	model.addAttribute("search", search);
	
	return "forward:/purchase/listPurchase.jsp";
}

	//@RequestMapping("/updateTranCode.do")
@RequestMapping( value="updateTranCode")
	public ModelAndView updateTranCode(@RequestParam("prodNo") int prodNo, @RequestParam("tranCode") String tranCode)
			throws Exception {
	
			System.out.println("/updateTranCode.do");
			System.out.println("san");
			Purchase purchase = purchaseService.getPurchase(prodNo);
			System.out.println(purchase);
					
			System.out.println("디버깅");
			
			if (tranCode.equals("000")) {								
				purchase.setTranCode("100");				
			} else if (tranCode.equals("100")) {				
				purchase.setTranCode("200");				
			}else if (tranCode.equals("200")) {				
				purchase.setTranCode("300");
				
			}
			
			purchase.getPurchaseProd().setProdNo(prodNo);
			
			System.out.println("디버깅2");
			purchaseService.updateTranCode(purchase); 
			System.out.println("디버깅3");
			System.out.println(purchase);
			
			
			Product product = productService.getProduct(prodNo);
			System.out.println("product: "+product);
		
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("product", product);
			modelAndView.setViewName("/product/listProduct?menu=manage");
		
			return modelAndView;
		}


}
