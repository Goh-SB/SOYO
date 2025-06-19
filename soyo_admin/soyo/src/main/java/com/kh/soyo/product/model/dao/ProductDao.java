package com.kh.soyo.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.soyo.auth.controller.AuthController;
import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.config.InterceptorConfig;
import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.product.model.vo.Product;

@Repository
public class ProductDao {

    private final InterceptorConfig interceptorConfig;

    private final AuthController authController;

    ProductDao(AuthController authController, InterceptorConfig interceptorConfig) {
        this.authController = authController;
        this.interceptorConfig = interceptorConfig;
    }

	public int productListCount(SqlSessionTemplate sqlSession) {
		

		return sqlSession.selectOne("productMapper.productListCount");
	}

	public ArrayList<Member> productList(SqlSessionTemplate sqlSession, PageInfo pi) {
	
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1 ) * limit;
	
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("productMapper.productList", null, rowBounds); 
	}

	public int enrollForm(SqlSessionTemplate sqlSession, Product product) {

		return sqlSession.insert("productMapper.enrollForm", product);
	}
	
	public int enrollFormTag(SqlSessionTemplate sqlSession, Product product) {

		return sqlSession.insert("productMapper.enrollFormTag", product);
	}

	public int enrollFormSize(SqlSessionTemplate sqlSession, Product product) {

		return sqlSession.insert("productMapper.enrollFormSize", product);
	}

	public int searchCount(SqlSessionTemplate sqlSession, String keyword) {

		return sqlSession.selectOne("productMapper.searchCount", keyword);
	}

	public ArrayList<Member> search(SqlSessionTemplate sqlSession, String keyword, PageInfo pi) {

		int startRow = ((pi.getCurrentPage() - 1) * pi.getBoardLimit()) + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("keyword", keyword);
		
		return (ArrayList)sqlSession.selectList("productMapper.search", hm);
	}

	public int filterCount(SqlSessionTemplate sqlSession, String cate) {

		return sqlSession.selectOne("productMapper.filterCount", cate);
	}

	public ArrayList<Member> filter(SqlSessionTemplate sqlSession, String cate, PageInfo pi) {

		int startRow = ((pi.getCurrentPage() - 1) * pi.getBoardLimit()) + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("cate", cate);
		
		return (ArrayList)sqlSession.selectList("productMapper.filter", hm);
	}

	public Product detail(SqlSessionTemplate sqlSession, Product p) {

		return sqlSession.selectOne("productMapper.detail", p);
	}
	
	public List<String> detailSubTag(SqlSessionTemplate sqlSession, Product p){
		return (List)sqlSession.selectList("productMapper.detailSubTag", p);
	}

	public Product datailSize(SqlSessionTemplate sqlSession, Product p) {


		return sqlSession.selectOne("productMapper.detailSize", p);
	}

	public int updateInsert(SqlSessionTemplate sqlSession, Product p) {

		return sqlSession.insert("productMapper.updateInsert", p);
	}

	// ------ 썸네일, 서브쎔네일 있을때 PRODUCT
	public int updateThumbnailProduct(SqlSessionTemplate sqlSession, Product p) {
		
		return sqlSession.update("productMapper.updateThumbnailProduct", p);
	}
	
	// ------ 썸네일, 서브썸네일 없을때 PRODUCT
	public int updateProduct(SqlSessionTemplate sqlSession, Product p) {

		return sqlSession.update("productMapper.updateProduct", p);
	}

	// -- 사이즈 업데이트
	public int updateSize(SqlSessionTemplate sqlSession, Product p) {
		
		return sqlSession.update("productMapper.updateSize", p);
	}

	// -- 재고수량 업데이트
	public int productStock(SqlSessionTemplate sqlSession, Product p) {

		return sqlSession.selectOne("productMapper.productStock", p);
	}
	
	// ----- subTag 업데이트
		public int updateSubTag(SqlSessionTemplate sqlSession, Product p, List<String> productSubTag) {
			System.out.println(productSubTag);
			ArrayList list =  (ArrayList)sqlSession.selectList("productMapper.originTag", p);
			
			System.out.println(list);
			
			int result1 = 1;
			int result2 = 1;
			for(int i = 0; i < productSubTag.size(); i++) {
				
				for(int j = 0; j < list.size(); j++) {
					
					if(!productSubTag.get(i).equals(list.get(j))) {
						
						p.setProductSubTag((String)list.get(j));
						result1 *= sqlSession.delete("productMapper.deleteSubTag", p);
					}
				}
				p.setProductSubTag(productSubTag.get(i));
				
				result2 *= sqlSession.insert("productMapper.updateSubTag", p);
			}
			
			return (result1 * result2);
		}

		
		public int updateThumbnailNoSub(SqlSessionTemplate sqlSession, Product p) {

			return sqlSession.update("productMapper.updateThumbnailNoSub", p);
		}

		public int updateSubThumbnail(SqlSessionTemplate sqlSession, Product p) {

			return sqlSession.update("productMapper.updateSubThumbnail", p);
		}






	
}
