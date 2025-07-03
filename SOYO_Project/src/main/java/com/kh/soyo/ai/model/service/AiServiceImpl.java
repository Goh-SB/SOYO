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
            if (containsAny(lowerText, Arrays.asList("여자", "여성", "여성용", "여자용", "여성복", "여자복", "여성의류", "여자의류", "여자친구", "여친", "여자아이", "여아", "여자아이용", "여성스러운", "여성적"))) {
                if (!processedTags.contains("여성")) {
                    processedTags.add("여성");
                    System.out.println("카테고리 매핑: 여성 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("남자", "남성", "남성용", "남자용", "남성복", "남자복", "남성의류", "남자의류", "남자친구", "남친", "남자아이", "남아", "남자아이용", "남성스러운", "남성적", "보이시"))) {
                if (!processedTags.contains("남성")) {
                    processedTags.add("남성");
                    System.out.println("카테고리 매핑: 남성 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("어린이", "아동", "아동용", "어린이용", "아동복", "어린이복", "아동의류", "어린이의류", "키즈", "아기", "유아", "유아용", "아기용", "아이용", "어린이용", "아동용", "키즈용", "베이비", "베이비용", "초등학생", "초등학생용"))) {
                if (!processedTags.contains("아동")) {
                    processedTags.add("아동");
                    System.out.println("카테고리 매핑: 아동 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("액세서리", "악세사리", "액세사리용", "악세사리용", "장신구", "소품", "패션소품", "악세서리", "악세서리용", "장식품", "장식", "소품용", "패션소품용", "악세사리류", "액세서리류"))) {
                if (!processedTags.contains("악세사리")) {
                    processedTags.add("악세사리");
                    System.out.println("카테고리 매핑: 악세사리 추가");
                }
            }
            
            // 상품 태그 키워드 매핑
            if (containsAny(lowerText, Arrays.asList("옷", "상의", "상의류", "윗옷", "윗도리", "상의용", "셔츠", "저고리", "크롭티", "티셔츠", "티", "블라우스", "니트", "스웨터", "가디건", "후드티", "후드", "맨투맨", "폴로", "폴로셔츠", "베스트", "조끼", "조끼류"))) {
                if (!processedTags.contains("top")) {
                    processedTags.add("top");
                    System.out.println("상품 태그 매핑: top 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("하의", "하의류", "아랫옷", "바지류", "치마류", "하의용", "바지", "치마", "팬츠", "슬랙스", "청바지", "데님", "스커트", "치마류", "바지용", "치마용", "하의용", "하의류"))) {
                if (!processedTags.contains("bottom")) {
                    processedTags.add("bottom");
                    System.out.println("상품 태그 매핑: bottom 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("옷", "외투", "외투류", "겉옷", "겉옷류", "외투용", "자켓", "코트", "조끼", "패딩", "패딩점퍼", "패딩자켓", "야상", "야상점퍼", "야상자켓", "트렌치코트", "더블코트", "싱글코트", "후드집업", "집업", "후드집업", "집업점퍼", "집업자켓"))) {
                if (!processedTags.contains("outer")) {
                    processedTags.add("outer");
                    System.out.println("상품 태그 매핑: outer 추가");
                }
            }
            // 비싼 관련 키워드 매핑 (17번 상품) - 최우선 처리
            boolean isExpensive = false;
            if (containsExactMatch(lowerText, Arrays.asList("비싼", "비싼거", "비싼 거", "제일비싼", "제일 비싼", "제일비싼거", "제일 비싼 거", "가장비싼", "가장 비싼", "가장비싼거", "가장 비싼 거", "고급", "고급스러운", "우아한", "우아", "엘레간트", "엘레간트한", "화려한", "화려", "고급스러운", "고급스럽게", "프리미엄", "프리미엄급", "고가", "고가의", "비싼가격", "비싼상품", "고급상품", "고급의류", "고급한복", "고급드레스", "최고급", "최고급의", "최고급상품", "최고급의류", "최고급한복", "최고급드레스")) || 
                containsAny(lowerText, Arrays.asList("드레스", "원피스"))) {
                if (!processedTags.contains("드레스")) {
                    processedTags.add("드레스");
                    System.out.println("상품 태그 매핑: 드레스 추가 (17번 상품)");
                    isExpensive = true;
                }
            }
            
            // "거" 키워드가 포함된 경우 추가 처리
            if (lowerText.contains("거")) {
                if (lowerText.contains("비싼") && !processedTags.contains("드레스")) {
                    processedTags.add("드레스");
                    System.out.println("상품 태그 매핑: 비싼+거 조합으로 드레스 추가 (17번 상품)");
                    isExpensive = true;
                }
            }
            
            // 싼 관련 키워드 매핑 (비싼 키워드가 아닌 경우에만)
            if (!isExpensive && containsExactMatch(lowerText, Arrays.asList("싼", "싼거", "싼 거", "제일싼", "제일 싼", "제일싼거", "제일 싼 거", "가장싼", "가장 싼", "가장싼거", "가장 싼 거", "저렴", "저렴한", "저렴하게", "싼가격", "싼상품", "저렴한가격", "저렴한상품", "합리적인", "합리적", "합리적인가격", "합리적인상품", "경제적인", "경제적", "경제적인가격", "경제적인상품", "가성비", "가성비좋은", "가성비좋게", "가성비좋은상품", "가성비좋은가격", "가성비좋은의류", "가성비좋은한복", "가성비좋은악세사리"))) {
                if (!processedTags.contains("악세사리")) {
                    processedTags.add("악세사리");
                    System.out.println("상품 태그 매핑: 악세사리 추가 (14번 상품)");
                }
            }
            if (containsAny(lowerText, Arrays.asList("악세사리", "액세서리", "장신구", "소품", "패션소품", "악세사리용", "댕기", "부채", "키링", "그립톡", "목걸이", "팔찌", "반지", "허리띠", "가방", "백", "지갑", "우산", "양산", "모자", "캡", "비니", "스카프", "머플러", "양말", "양말류", "신발", "구두", "운동화", "스니커즈", "샌들", "슬리퍼", "부츠", "장화"))) {
                if (!processedTags.contains("acc")) {
                    processedTags.add("acc");
                    System.out.println("상품 태그 매핑: acc 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("의류", "의상", "모던한복", "모던", "한복", "모던한복류", "모던한복용", "모던스타일", "모던한", "현대적인", "현대적", "세련된", "세련", "트렌디", "트렌디한", "패션", "패션스러운"))) {
                if (!processedTags.contains("모던한복")) {
                    processedTags.add("모던한복");
                    System.out.println("상품 태그 매핑: 모던한복 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("아무거나", "데일리한복", "데일리", "일상한복", "일상", "일상용", "데일리용", "일상복", "데일리복", "편한", "편안한", "편하게", "편안하게", "실용적인", "실용적", "활용도", "활용도높은", "활용도높게"))) {
                if (!processedTags.contains("데일리한복")) {
                    processedTags.add("데일리한복");
                    System.out.println("상품 태그 매핑: 데일리한복 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("랜덤", "스트릿한복", "스트릿", "스트릿한복류", "스트릿한복용", "스트릿스타일", "스트릿한", "스트릿패션", "스트릿스러운", "스트릿적", "힙합", "힙합스타일", "힙합한", "힙합스러운", "힙합적", "캐주얼", "캐주얼한", "캐주얼스러운", "캐주얼적"))) {
                if (!processedTags.contains("스트릿한복")) {
                    processedTags.add("스트릿한복");
                    System.out.println("상품 태그 매핑: 스트릿한복 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("여름한복", "여름", "여름한복류", "여름한복용", "여름용", "여름스타일", "여름한", "여름스러운", "여름적", "시원한", "시원하게", "가벼운", "가볍게", "얇은", "얇게", "통기성", "통기성좋은", "통기성좋게", "시원", "가벼움", "얇음"))) {
                if (!processedTags.contains("여름한복")) {
                    processedTags.add("여름한복");
                    System.out.println("상품 태그 매핑: 여름한복 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("겨울한복", "겨울", "겨울한복류", "겨울한복용", "겨울용", "겨울스타일", "겨울한", "겨울스러운", "겨울적", "따뜻한", "따뜻하게", "두꺼운", "두껍게", "보온성", "보온성좋은", "보온성좋게", "따뜻함", "두꺼움", "보온"))) {
                if (!processedTags.contains("겨울한복")) {
                    processedTags.add("겨울한복");
                    System.out.println("상품 태그 매핑: 겨울한복 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("사계절용", "사계절", "사계절한복", "사계절한복류", "사계절한복용", "사계절용", "사계절스타일", "사계절한", "사계절스러운", "사계절적", "올시즌", "올시즌용", "올시즌한", "올시즌스러운", "올시즌적", "시즌리스", "시즌리스용", "시즌리스한", "시즌리스스러운", "시즌리스적"))) {
                if (!processedTags.contains("사계절용")) {
                    processedTags.add("사계절용");
                    System.out.println("상품 태그 매핑: 사계절용 추가");
                }
            }
            if (containsAny(lowerText, Arrays.asList("남녀공용", "공용", "남녀공용한복", "남녀공용한복류", "남녀공용한복용", "남녀공용용", "남녀공용스타일", "남녀공용한", "남녀공용스러운", "남녀공용적", "유니섹스", "유니섹스용", "유니섹스한", "유니섹스스러운", "유니섹스적", "남녀", "남녀용", "남녀한", "남녀스러운", "남녀적"))) {
                if (!processedTags.contains("남녀공용")) {
                    processedTags.add("남녀공용");
                    System.out.println("상품 태그 매핑: 남녀공용 추가");
                }
            }
        }
        
        // System.out.println("처리된 태그: " + processedTags);
        // System.out.println("=== 키워드 처리 완료 ===");
        
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
    
    private boolean containsExactMatch(String text, List<String> keywords) {
        for (String keyword : keywords) {
            if (text.equals(keyword) || text.contains(" " + keyword + " ") || text.startsWith(keyword + " ") || text.endsWith(" " + keyword)) {
                return true;
            }
        }
        return false;
    }
} 