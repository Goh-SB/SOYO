package com.kh.soyo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.mybatis.spring.annotation.MapperScan;

@SpringBootApplication(exclude= {SecurityAutoConfiguration.class})
@MapperScan("com.kh.soyo.**.model.dao")
public class SoyoProjectApplication {

	public static void main(String[] args) {
		
		/*
        // 암호화 스크립트
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String newHash = encoder.encode("pwd123");
        System.out.println("newHash = " + newHash);

        boolean result = encoder.matches("pwd123", newHash);
        System.out.println("matches result = " + result);  // true 나와야 정상
		*/

        SpringApplication.run(SoyoProjectApplication.class, args);
	}

}
