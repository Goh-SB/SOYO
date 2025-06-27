package com.kh.soyo.ai.model.service;

import com.kh.soyo.product.model.vo.Product;
import java.util.List;

public interface AiService {
    Product getBestProductByTags(List<String> tags);
    List<String> processKeywords(List<String> tags, String inputText);
    List<Product> getAllProducts();
} 