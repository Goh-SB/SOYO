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
    public String handleCancelPayment(@RequestBody Map<String, Object> data) {
    		
    	 String impUid = (String) data.get("imp_uid");
    	    String reason = (String) data.get("reason");
    	    return cancelPayment(impUid, reason);
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