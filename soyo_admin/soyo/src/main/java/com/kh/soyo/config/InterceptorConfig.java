package com.kh.soyo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer{

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {

        registry.addResourceHandler("/resources/product_upfile/**")
        .addResourceLocations("file:///C:/SOYO/soyo_admin/soyo/src/main/webapp/resources/product_upfile/");

	}


		
	

	
	
}
