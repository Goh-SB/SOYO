package com.kh.soyo.ai.model.service;

import com.kh.soyo.product.model.vo.Product;
import com.kh.soyo.ai.model.dao.AiDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class AiServiceImpl implements AiService {

    @Autowired
    private AiDao aiDao;

    @Override
    public Product getBestProductByTags(List<String> tags) {
        return aiDao.selectBestProductByTags(tags);
    }
} 