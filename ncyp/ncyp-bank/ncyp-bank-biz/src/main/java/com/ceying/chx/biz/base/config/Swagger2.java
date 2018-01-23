package com.ceying.chx.biz.base.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * 功能说明: 设置Swagger2的配置类<br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl
 * 开发时间: 2017/11/6 22:26<br>
 * <br>
 */
@Configuration
@EnableSwagger2
public class Swagger2 {
    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.ceying.chx.biz.base.controller"))
//                .apis(RequestHandlerSelectors.basePackage("com.ceying.chx.biz.business"))
                .paths(PathSelectors.any())
                .build();
    }
    private
    ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("springboot利用swagger构建api文档")
                .description("简单优雅的restfun风格")
                .termsOfServiceUrl("")
                .version("1.0")
                .build();
    }
}
