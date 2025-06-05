package com.kh.soyo.common;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/soyo")
public class PortOneController {
	
    @PostMapping("/cancelPayment")
    @ResponseBody
    public Map<String, Object> handleCancelPayment(@RequestBody Map<String, Object> data) {
        String impUid = (String) data.get("imp_uid");
        String reason = (String) data.get("reason");

        String apiResponse = cancelPayment(impUid, reason);

        Map<String, Object> result = new HashMap<>();
        try {
            com.fasterxml.jackson.databind.ObjectMapper mapper = new com.fasterxml.jackson.databind.ObjectMapper();
            Map<String, Object> jsonMap = mapper.readValue(apiResponse, Map.class);

            Object codeObj = jsonMap.get("code");
            int code = (codeObj instanceof Number) ? ((Number) codeObj).intValue() : -1;

            if (code == 0) {
                result.put("success", true);
                result.put("message", "환불 성공");
            } else {
                result.put("success", false);
                result.put("message", jsonMap.get("message"));
            }
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "응답 파싱 오류: " + e.getMessage());
        }

        return result;
    }

    public String getPortOneAccessToken() {
        String url = "https://api.iamport.kr/users/getToken";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        Map<String, String> body = new HashMap<>();
        body.put("imp_key", "1327007504454686");
        body.put("imp_secret", "bvnxZESurQQC1WxWBWmRpboFN2j28InuPyZNYc8WjHWQ22mANk410wLFiR8wcVfgP73IG9omBgTPPhD2");

        // ✅ ObjectMapper로 JSON 문자열로 변환
        String jsonBody;
        try {
            jsonBody = new com.fasterxml.jackson.databind.ObjectMapper().writeValueAsString(body);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

        HttpEntity<String> request = new HttpEntity<>(jsonBody, headers);
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Map> response = restTemplate.postForEntity(url, request, Map.class);

        Map responseBody = (Map) response.getBody().get("response");
        return (String) responseBody.get("access_token");
    }

    @GetMapping("/portOnePay")
    public String showPortOnePayPage() {
        return "portOnePay"; // /WEB-INF/views/portOnePay.jsp
    }
    
    public String cancelPayment(String impUid, String reason) {
        String token = getPortOneAccessToken();
        String url = "https://api.iamport.kr/payments/cancel";
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(token);
        
        String jsonBody = String.format(
                "{\"imp_uid\":\"%s\", \"reason\":\"%s\"}",
                impUid,  reason
        );
        RestTemplate restTemplate = new RestTemplate();
        
        HttpEntity<String> request = new HttpEntity<String>(jsonBody, headers);
        ResponseEntity<String> response = restTemplate.postForEntity(url, request, String.class);
        
        
        System.out.println("imp_uid: " + impUid);
    
        System.out.println("reason: " + reason);
        System.out.println("token: " + token);
        System.out.println("cancel response: " + response.getBody());
        return response.getBody();
    }

}