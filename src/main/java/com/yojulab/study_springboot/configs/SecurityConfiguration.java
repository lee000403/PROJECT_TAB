package com.yojulab.study_springboot.configs;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration {
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
        // None using csrf protection
        httpSecurity.csrf().disable();
        // 권한에 대한 부분 : url & roles : user url & roles
        // url, roles from Dao
        httpSecurity.authorizeHttpRequests() // 로그인
                // .requestMatchers("/manager*").hasAnyRole("ADMIN", "MANAGER")
                // .requestMatchers("/admin*").hasRole("ADMIN")
                .requestMatchers("/TAB_PAGE/mypage").authenticated()
                .requestMatchers("/TAB_PAGE/community*").authenticated() // 로그인한 대상지
                .requestMatchers("/TAB_PAGE/main_page_after_login").authenticated()
                .anyRequest().permitAll(); // 그 외 전체 대상
        httpSecurity.formLogin(login -> login.loginPage("/loginForm") // 로그인 페이지로 이동 시키는 것
                .failureUrl("/loginForm?fail=true") // 로그인 실패하고 난 후 보내는 페이지랑 파라미터 설정
                .loginProcessingUrl("/login")
                .defaultSuccessUrl("/TAB_PAGE/home_after/")); // 그전에 실행했던 url을 기억해서 로그인을 하고나면 그 화면을 보내준다.
        httpSecurity.logout(logout -> logout
                .logoutSuccessUrl("/TAB_PAGE/home/")
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID"));

                
        httpSecurity.exceptionHandling()
                        .accessDeniedPage("/TAB_PAGE/home/");
        return httpSecurity.build();
    }

    @Bean
    public BCryptPasswordEncoder encoderPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
