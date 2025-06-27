package com.kh.soyo.ai.model.dao;

import com.kh.soyo.product.model.vo.Product;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class AiDaoImpl implements AiDao {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public Product selectBestProductByTags(List<String> tags) {
        Map<String, Object> param = new HashMap<>();
        param.put("tags", tags);
        
        System.out.println("=== DAO 호출 ===");
        System.out.println("전달받은 태그: " + tags);
        System.out.println("파라미터 맵: " + param);
        
        Product result = sqlSession.selectOne("aiMapper.selectBestProductByTags", param);
        
        System.out.println("쿼리 실행 결과: " + result);
        System.out.println("=== DAO 호출 완료 ===");
        
        return result;
    }
    
    @Override
    public List<Product> selectAllProducts() {
        System.out.println("=== 전체 상품 조회 ===");
        List<Product> products = sqlSession.selectList("aiMapper.selectAllProducts");
        System.out.println("전체 상품 수: " + products.size());
        for (Product product : products) {
            System.out.println("상품: " + product.getProductName() + 
                             ", 카테고리: " + product.getProductCategory() + 
                             ", 태그: " + product.getProductTag());
        }
        System.out.println("=== 전체 상품 조회 완료 ===");
        return products;
    }
} 