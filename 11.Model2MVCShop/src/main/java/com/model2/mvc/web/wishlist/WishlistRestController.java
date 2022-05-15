package com.model2.mvc.web.wishlist;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.wishlist.WishlistService;




@RestController
@RequestMapping("/wishlist/*")
public class WishlistRestController {
	
	
	@Autowired
	@Qualifier("wishlistServiceImpl")
	private WishlistService wishlistService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	//setter Method 구현 않음

public WishlistRestController() {
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


@RequestMapping( value="json/addWishlist", method=RequestMethod.POST )
public String addWishlist( @RequestBody Product product, @RequestBody User user ) throws Exception {
	
	System.out.println("addWishlist");
	
	
	int prodNo = product.getProdNo();
	
	//Business Logic
	wishlistService.addWishlist(product);
	
	return "forward:/purchase/addPurchaseView.jsp?prodNo="+prodNo;
	
	}

}



