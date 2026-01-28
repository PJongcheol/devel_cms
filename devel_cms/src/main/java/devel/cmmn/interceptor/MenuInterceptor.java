package devel.cmmn.interceptor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import devel.cmmn.login.vo.LoginVO;
import devel.cmmn.menu.service.MenuService;
import devel.cmmn.menu.vo.MenuVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class MenuInterceptor implements HandlerInterceptor {

	private final MenuService menuService;

    public MenuInterceptor(MenuService menuService) {
        this.menuService = menuService;
    }

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {

        // 로그인 사용자 정보
    	LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");

        if (user != null) {
            String authGtpCd = user.getAuthGrpCd();
        	List<MenuVO> userMenu = menuService.getMenu("user", authGtpCd);
            List<MenuVO> leftAdminMenu = menuService.getMenu("admin", authGtpCd);

            request.setAttribute("userMenu", userMenu);
            request.setAttribute("leftAdminMenu", leftAdminMenu);
        }

        return true;
    }
}

