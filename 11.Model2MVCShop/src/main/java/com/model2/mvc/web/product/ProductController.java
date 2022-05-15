package com.model2.mvc.web.product;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
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
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	
		
	//setter Method 구현 않음	
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
	
	
	//@RequestMapping("/addProductView.do")
	@RequestMapping( value="addProductView", method=RequestMethod.GET )
	public String addProductView() throws Exception {

		System.out.println("/addProductView.do");
		
		return "redirect:/product/addProductView.jsp";
	}
	
	//@RequestMapping("/addProduct.do")
	@RequestMapping( value="addProduct", method=RequestMethod.POST )	
	public String addProduct( @ModelAttribute("product") Product product, Model model, @RequestParam("uploadfiles[]") MultipartFile[] fileArray) throws Exception {

		System.out.println("/addProduct.do");
		//Business Logic
		
		//
	//	try { String baseDir = "D:\\imgFile"; files.transferTo(new File(baseDir + "\\"+ files.getOriginalFilename())); } catch (Exception e) { e.printStackTrace(); }
	//	System.out.println(files);
		
		//String temDir = "C:\\Users\\pjn39\\git\\Project_Refactoring\\07.Model2MVCShop(Alpha)\\src\\main\\webapp\\images\\uploadFiles\\";
		//String temDir = "C:\\Users\\pjn39\\git\\Project_Refactoring\\07.Model2MVCShop(Alpha)\\src\\main\\webapp\\images\\uploadFiles\\";
		String temDir = "C:\\workspace2\\11.Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles";
		
		String fileName = "";
	
		
		for(int i=0; i<fileArray.length;i++) {
		
			if(!fileArray[i].getOriginalFilename().isEmpty()) {
				fileArray[i].transferTo(new File(temDir, fileArray[i].getOriginalFilename()));
				System.out.println("파일명 :: "+fileArray[i].getOriginalFilename());
				
			}else {
				System.out.println("파일업로드 실패...?");
			}
		
			fileName+=fileArray[i].getOriginalFilename()+"&";
		//	fileName+=fileArray[i].getOriginalFilename();
			
			System.out.println("저장될 파일이름 : "+fileName);
		}
	
		
		System.out.println("확인용"+product);
			
		product.setManuDate(product.getManuDate().replace("-","" ));
		
		product.setFileName(fileName);
		
			
		//String maxNum =productService.MaxProduct()+"";
		
		/*
		int maxNum =productService.MaxProduct();
		
				
			if(maxNum == 0) {
				maxNum = 10000;
				//stMaxNum = Integer.parseInt(maxNum);
			}else {
				maxNum++;
			}
			
			if(maxNum+1==product.getProdNo()) {
				product.setProdNo(maxNum-1);
			}
																
		product.setProdNo(maxNum);
		*/
		
		productService.addProduct(product);		
		
		System.out.println("확인용2"+product);
		
		model.addAttribute("product",product);
												
		return "forward:/product/getProduct.jsp";	
	}
	
	

	//@RequestMapping("/listProduct.do")
	@RequestMapping( value="listProduct", method=RequestMethod.GET )
	public String listProduct( @ModelAttribute("search") Search search , Model model) throws Exception{
		
		System.out.println("/listProduct.do");
		
		System.out.println(search);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		
		System.out.println("테스트"+map.get("list"));
					
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/product/listProduct.jsp";
	}
	
	@RequestMapping( value="listProduct", method=RequestMethod.POST )
	public String listProduct( @ModelAttribute("search") Search search , Model model , HttpServletRequest request, HttpSession session) throws Exception{
		
		System.out.println("/listProduct.do post");
		
		System.out.println(search);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		
		
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		
		String sessionId=((User)session.getAttribute("user")).getUserId();
		Map<String , Object> map2=purchaseService.getPurchaseList(search,sessionId);
		
		
		
			
		System.out.println(map);
					
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/product/listProduct.jsp";
	}
	

	
	//@RequestMapping("/updateProductView.do")
	@RequestMapping( value="updateProductView", method=RequestMethod.GET )
	public String updateProductView( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{

		System.out.println("/updateProductView.do");
		//Business Logic
		System.out.println(prodNo);
		Product product = productService.getProduct(prodNo);
		// Model 과 View 연결
		model.addAttribute("product", product);
		
		return "forward:/product/updateProductView.jsp?prodNo="+prodNo;
	}
	
	//@RequestMapping("/updateProduct.do")
	@RequestMapping( value="updateProduct", method=RequestMethod.POST )
	public String updateProduct( @ModelAttribute("product") Product product , Model model, HttpServletRequest request, @RequestParam("uploadfiles[]") MultipartFile[] fileArray ) throws Exception{

		System.out.println("/updateProduct.do");
		
		String temDir = "C:\\workspace2\\11.Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles";
		
		String fileName = "";
	
		
		for(int i=0; i<fileArray.length;i++) {
		
			if(!fileArray[i].getOriginalFilename().isEmpty()) {
				fileArray[i].transferTo(new File(temDir, fileArray[i].getOriginalFilename()));
				System.out.println("파일명 :: "+fileArray[i].getOriginalFilename());
				
			}else {
				System.out.println("파일업로드 실패...?");
			}
		
			fileName+=fileArray[i].getOriginalFilename()+"&";
		//	fileName+=fileArray[i].getOriginalFilename();
			
			System.out.println("저장될 파일이름 : "+fileName);
		}
	
		
		System.out.println("확인용"+product);
			
		product.setManuDate(product.getManuDate().replace("-","" ));
		
		product.setFileName(fileName);			
		int prodNo = product.getProdNo();		
		product.setProdNo(prodNo);
		
		System.out.println("hyeongsan"+product.getProdNo()+prodNo+product.getFileName());

		//Business Logic
	
		
		System.out.println("san"+product);
		productService.updateProduct(product);
		
		//int prodNo = Integer.parseInt(request.getParameter("prodNo"));		
		
		return "forward:/product/getProduct.jsp?prodNo="+prodNo ;
		
	}
	
	//@RequestMapping("/getProduct.do")
	@RequestMapping( value="getProduct", method=RequestMethod.GET )
	public String getProduct( @RequestParam("prodNo") int prodNo , Model model  ) throws Exception {
		

		Product product = productService.getProduct(prodNo);
		
		model.addAttribute("product", product);
		
		return "forward:/product/getProduct.jsp";
	}
	
	
}