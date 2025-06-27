package com.kh.soyo.ai.model.service;

import com.kh.soyo.product.model.vo.Product;
import com.kh.soyo.ai.model.dao.AiDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;

@Service
public class AiServiceImpl implements AiService {

    @Autowired
    private AiDao aiDao;

    @Override
    public Product getBestProductByTags(List<String> tags) {
        System.out.println("=== AI 추천 요청 태그: " + tags + " ===");
        return aiDao.selectBestProductByTags(tags);
    }
    
    @Override
    public List<Product> getAllProducts() {
        return aiDao.selectAllProducts();
    }
    
    @Override
    public List<String> processKeywords(List<String> tags, String inputText) {
        List<String> processedTags = new ArrayList<>(tags);
        
        System.out.println("=== 키워드 처리 시작 ===");
        System.out.println("원본 태그: " + tags);
        System.out.println("입력 텍스트: " + inputText);
        
        // "기본" 태그가 있으면 제거 (모든 상품 대상)
        processedTags.removeIf(tag -> "기본".equals(tag));
        
        // 카테고리 키워드 매핑
        if (inputText != null && !inputText.trim().isEmpty()) {
            String lowerText = inputText.toLowerCase();
            
            // 카테고리 키워드 매핑
            if (containsAny(lowerText, Arrays.asList("여자", "여성", "여성용", "여자용", "여성복", "여자복", "여성의류", "여자의류"))) {
                if (!processedTags.contains("여성")) {
                    processedTags.add("여성");
                    System.out.println("카테고리 매핑: 여성 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("남자", "남성", "남성용", "남자용", "남성복", "남자복", "남성의류", "남자의류"))) {
                if (!processedTags.contains("남성")) {
                    processedTags.add("남성");
                    System.out.println("카테고리 매핑: 남성 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("어린이", "아동", "아동용", "어린이용", "아동복", "어린이복", "아동의류", "어린이의류", "키즈", "아기", "유아"))) {
                if (!processedTags.contains("아동")) {
                    processedTags.add("아동");
                    System.out.println("카테고리 매핑: 아동 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("액세서리", "악세사리", "액세사리용", "악세사리용", "장신구", "소품", "패션소품"))) {
                if (!processedTags.contains("악세사리")) {
                    processedTags.add("악세사리");
                    System.out.println("카테고리 매핑: 악세사리 추가");
                }
            }
            
            // 상품 태그 키워드 매핑
            if (containsAny(lowerText, Arrays.asList("상의", "상의류", "윗옷", "윗도리", "상의용", "셔츠", "저고리", "크롭티"))) {
                if (!processedTags.contains("top")) {
                    processedTags.add("top");
                    System.out.println("상품 태그 매핑: top 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("하의", "하의류", "아랫옷", "바지류", "치마류", "하의용", "바지", "치마"))) {
                if (!processedTags.contains("bottom")) {
                    processedTags.add("bottom");
                    System.out.println("상품 태그 매핑: bottom 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("외투", "외투류", "겉옷", "겉옷류", "외투용", "자켓", "코트", "조끼"))) {
                if (!processedTags.contains("outer")) {
                    processedTags.add("outer");
                    System.out.println("상품 태그 매핑: outer 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("악세사리", "액세서리", "장신구", "소품", "패션소품", "악세사리용", "댕기", "부채", "키링", "그립톡", "목걸이", "팔찌", "반지", "허리띠"))) {
                if (!processedTags.contains("acc")) {
                    processedTags.add("acc");
                    System.out.println("상품 태그 매핑: acc 추가");
                }
            }
            
            // 특정 상품 키워드 매핑 (PRODUCT_TAG 테이블의 태그들)
            if (containsAny(lowerText, Arrays.asList("드레스", "원피스"))) {
                if (!processedTags.contains("드레스")) {
                    processedTags.add("드레스");
                    System.out.println("상품 태그 매핑: 드레스 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("모던한복", "모던", "한복"))) {
                if (!processedTags.contains("모던한복")) {
                    processedTags.add("모던한복");
                    System.out.println("상품 태그 매핑: 모던한복 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("데일리한복", "데일리", "일상한복"))) {
                if (!processedTags.contains("데일리한복")) {
                    processedTags.add("데일리한복");
                    System.out.println("상품 태그 매핑: 데일리한복 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("스트릿한복", "스트릿"))) {
                if (!processedTags.contains("스트릿한복")) {
                    processedTags.add("스트릿한복");
                    System.out.println("상품 태그 매핑: 스트릿한복 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("여름한복", "여름"))) {
                if (!processedTags.contains("여름한복")) {
                    processedTags.add("여름한복");
                    System.out.println("상품 태그 매핑: 여름한복 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("겨울한복", "겨울"))) {
                if (!processedTags.contains("겨울한복")) {
                    processedTags.add("겨울한복");
                    System.out.println("상품 태그 매핑: 겨울한복 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("사계절용", "사계절"))) {
                if (!processedTags.contains("사계절용")) {
                    processedTags.add("사계절용");
                    System.out.println("상품 태그 매핑: 사계절용 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("남녀공용", "공용"))) {
                if (!processedTags.contains("남녀공용")) {
                    processedTags.add("남녀공용");
                    System.out.println("상품 태그 매핑: 남녀공용 추가");
                }
            }
        }
        
        System.out.println("처리된 태그: " + processedTags);
        System.out.println("=== 키워드 처리 완료 ===");
        
        return processedTags;
    }
    
    private boolean containsAny(String text, List<String> keywords) {
        for (String keyword : keywords) {
            if (text.contains(keyword)) {
                return true;
            }
        }
        return false;
    }
} 