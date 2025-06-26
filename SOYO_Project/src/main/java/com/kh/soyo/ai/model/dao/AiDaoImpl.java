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
        return sqlSession.selectOne("aiMapper.selectBestProductByTags", param);
    }
} 