package com.kh.soyo.ai.model.dao;

import com.kh.soyo.product.model.vo.Product;
import java.util.List;

public interface AiDao {
    Product selectBestProductByTags(List<String> tags);
} 