package com.hp.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.ArrayList;

/**
 * @Auther: Administrator
 * @Date: 2021-02-01
 * @Description:
 */
@EnableSwagger2
@Configuration
public class SwaggerConfig {
    //配置swagger的Docket的bean实例
    @Bean
    public Docket getDocket(){
        /*
         * RequestHandlerSelectors 配置要扫描接口的方式
         * 参数：
         *   basePackage("com.hp.controller") 指定要扫描的包
         *   withClassAnnotation(RestController.class) 扫描类上的注解，参数是一个类注解的反射对象
         *   withMethodAnnotation(GetMapping.class) 扫描方法上的注解，参数是一个方法注解的反射对象
         *   any() 扫描全部
         *   none() 不扫描
         *
         *
         * paths 过滤路径（就是不去扫描的路径）
         * any() 全部过滤
         * none() 不过滤
         * regex(/[a-z]/) 过滤到正则表达式代表的路径
         * ant("xxx") 指定路径过滤
        //.paths(PathSelectors.ant("/hp/**"))
         */
        return new Docket(DocumentationType.SWAGGER_2).apiInfo(apiInfo()).
                select().apis(RequestHandlerSelectors.basePackage("com.hp.controller")).build();

    }
    //配置apiInfo
    private ApiInfo apiInfo(){
        Contact DEFAULT_CONTACT = new Contact("hp", "", "");
        return new ApiInfo(
                "hp`s Documentation",
                "Api Documentation",
                "1.0",
                "urn:tos",
                DEFAULT_CONTACT,
                "Apache 2.0",
                "http://www.apache.org/licenses/LICENSE-2.0",
                new ArrayList()
        );
    }
}
