package com.atm.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.lang.NonNull;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
@ComponentScan(basePackages= {"com.atm.controller"})
@EnableWebMvc
@Configuration
public class MvcConfig implements WebMvcConfigurer{
	@Bean
	 public InternalResourceViewResolver getInternalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/");
		resolver.setSuffix(".jsp");
		return resolver;
	 }
	@Override
	public void addViewControllers(@NonNull ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("login_insert_card");
		registry.addViewController("/toLogin").setViewName("login_insert_card");
		registry.addViewController("/toPin").setViewName("login_input_pin");
		registry.addViewController("/toAdmin").setViewName("account_admin-main");
		registry.addViewController("/toOptions").setViewName("account_options");
		registry.addViewController("/toSelectTypeDeposit").setViewName("account_deposit");                
	}

	@Override
	public void addResourceHandlers(@NonNull ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
		WebMvcConfigurer.super.addResourceHandlers(registry);
	}   
	
	
}
