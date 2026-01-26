package devel.cmmn.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	private final LoginInterceptor loginInterceptor;
    private final MenuInterceptor menuInterceptor;

    public WebConfig(LoginInterceptor loginInterceptor,MenuInterceptor menuInterceptor) {
		this.loginInterceptor = loginInterceptor;
		this.menuInterceptor = menuInterceptor;
	}

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(loginInterceptor)
                .addPathPatterns("/**")
        		.excludePathPatterns(
        			"/login.do",
        			"/login/**",
        			"/css/**",
        			"/js/**",
        			"/image/**",
        			"/error"
        		).order(1);
        registry.addInterceptor(menuInterceptor)
		        .addPathPatterns("/**")
		        .excludePathPatterns(
	        		"/login.do",
        			"/login/**",
        			"/css/**",
        			"/js/**",
        			"/image/**",
        			"/error"
		        )
		        .order(2);
    }
}

