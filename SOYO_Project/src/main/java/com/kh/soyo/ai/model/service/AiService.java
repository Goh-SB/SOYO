package com.kh.soyo.ai.model.service;

import com.kh.soyo.product.model.vo.Product;
import java.util.List;

public interface AiService {
    Product getBestProductByTags(List<String> tags);
} 