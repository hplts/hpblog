package com.hp;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@MapperScan("com.hp.mapper")
@SpringBootApplication
public class HpblogApplication {

    public static void main(String[] args) {
        SpringApplication.run(HpblogApplication.class, args);
    }

}
