package com.kh.soyo.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.common.template.Pagination;
import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.product.model.service.ProductService;
import com.kh.soyo.product.model.vo.Product;
import com.kh.soyo.recent.model.service.RecentService;
import com.kh.soyo.recent.model.vo.Recent;
import com.kh.soyo.review.model.service.ReviewService;
import com.kh.soyo.review.model.vo.Review;
import com.kh.soyo.wishlist.model.service.WishListService;
import com.kh.soyo.wishlist.model.vo.Wish;

import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ReviewService reviewService;

	@Autowired
	private WishListService wishListService;
	
	@Autowired
	private RecentService recentService;

	
	@GetMapping("/stock")
	@ResponseBody
	public Map<String, Object> getProductStock(@RequestParam("productNo") int productNo,
	                                           @RequestParam("size") String productSize) {
		
	    int stock = productService.getProductStock(productNo, productSize);
	    Map<String, Object> result = new HashMap<>();
	    result.put("stock", stock);
	    return result;
	}

	
	@ResponseBody
	@GetMapping("/sort")
	public Map<String, Object> ajaxSortedList(@RequestParam String category,
	                                    @RequestParam(name = "sort", required = false, defaultValue = "popular") String sort,
	                                    @RequestParam(value = "page", defaultValue = "1") int currentPage) {
		
	    String dbCategory = null;
	    String tagFilter = null;
	    
	    // category 파라미터를 DB에 맞게 변환
	    switch (category) {
	        case "womens":
	            dbCategory = "여성";
	            break;
	        case "mens":
	            dbCategory = "남성";
	            break;
	        case "kids":
	            dbCategory = "아동";
	            break;
	        case "accessory":
	            dbCategory = "악세사리";
	            break;
	        case "outer":
	        case "top":
	        case "bottom":
	            tagFilter = category; // 태그 기반 필터링
	            break;
	        case "all":
	        default:
	            dbCategory = null; // 전체 상품
	            break;
	    }

	    int listCount;
	    if (tagFilter != null) {
	        listCount = productService.selectProductListCountByTag(tagFilter);
	    } else {
	        listCount = productService.selectProductListCountForSort(dbCategory, tagFilter);
	    }
	    
	    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 8);
	    
	    List<Product> products = productService.selectSortedProductList(dbCategory, tagFilter, sort, pi);
	    
	    Map<String, Object> response = new HashMap<>();
	    response.put("products", products);
	    response.put("pi", pi);
	    
	    return response;
	}

	

	@GetMapping("/productDetail")
	public String showProductDetail(@RequestParam("no") int productNo, Model model, HttpSession session, Recent r) {
	    // 상품 상세 정보 리스트 조회
	    List<Product> productList = productService.selectProductByNo(productNo);

	    if (productList == null || productList.isEmpty()) {
	        // 예외 처리: 상품이 존재하지 않을 때
	        return "common/errorPage"; // 에러 페이지로 리턴하거나 메시지 전달
	    }
	    
	    // 첫 번째 상품 정보 사용 (대표 정보)
	    Product product = productList.get(0);

	    // 로그인한 회원 정보 가져오기
	    Member loginUser = (Member) session.getAttribute("loginUser");

	    
	    boolean isWished = false;
	    if (loginUser != null) {
	    	
	        String memberId = loginUser.getMemberId();
	        r.setMemberId(memberId);
	        r.setProductNo(productNo);
	        recentService.updateRecent(r);
	        
	        // 장바구니 담긴 상태 조회
	        boolean inCart = productService.isInCart(memberId, productNo);
	        product.setInCart(inCart);

	        // 찜 여부 조회
	        Wish wish = new Wish();
	        wish.setMemberId(memberId);
	        wish.setProductNo(productNo);
	        isWished = wishListService.isWishAlreadyExists(wish);
	    }
	    model.addAttribute("isWished", isWished);

	    // 태그 및 리뷰 조회
	    List<String> tagList = productService.getTagsForProduct(productNo);
	    List<Review> reviewList = reviewService.selectReviewList(productNo);

	    // 모델에 담아서 전달
	    model.addAttribute("product", product);           // 단일 상품 정보
	    model.addAttribute("productList", productList);   // 사이즈별 상품 리스트
	    model.addAttribute("tagList", tagList);
	    model.addAttribute("reviewList", reviewList);

	    return "product/productDetail";
	}


	
	@GetMapping("/productList")
	public String showProductList(@RequestParam(value = "type", required = false, defaultValue = "all") String type,
	                              @RequestParam(value = "search", required = false) String search,
								  @RequestParam(value="cpage", defaultValue="1") int currentPage,
	                              Model model) {

		int listCount;
		String category = null;
		String tag = null;

	    // type 파라미터를 카테고리와 태그로 분리
	    switch (type) {
	        case "mens":
	            category = "남성";
	            break;
	        case "womens":
	            category = "여성";
	            break;
	        case "kids":
	            category = "아동";
	            break;
	        case "accessory":
	            category = "악세사리";
	            break;
	        case "outer":
	        case "top":
	        case "bottom":
	            tag = type;
	            break;
	        default:
	            // 전체 상품
	            break;
	    }

	    if (search != null && !search.trim().isEmpty()) {
			listCount = productService.searchProductListCount(category, tag, search);
	    } else {
	        if (tag != null) {
	            listCount = productService.selectProductListCountByTag(tag);
	        } else if (category != null) {
	            listCount = productService.selectProductListCountByCategory(category);
	        } else {
	            listCount = productService.selectProductListCount();
	        }
	    }
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 8);

		List<Product> productList;

		if (search != null && !search.trim().isEmpty()) {
			productList = productService.searchProductList(category, tag, search, pi);
		} else {
			if (tag != null) {
				productList = productService.selectProductListByTag(tag, pi);
			} else if (category != null) {
				productList = productService.selectProductListByCategory(category, pi);
			} else {
				productList = productService.selectProductList(pi);
			}
		}

	    model.addAttribute("productList", productList);
	    model.addAttribute("type", type);
	    model.addAttribute("search", search); 
		model.addAttribute("pi", pi);

	    return "product/productList";
	}
	
	


	
}