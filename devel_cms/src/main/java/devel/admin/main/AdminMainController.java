package devel.admin.main;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import devel.cmmn.base.BaseController;
import devel.cmmn.menu.service.MenuService;
import jakarta.servlet.http.HttpSession;

/**
 * 관리자 메인 관리를 위한 컨트롤러
 * @Class Name   : AdminMainController
   @Description  : 관리자 대시보드 및 대시보드 동작을 위한 컨트롤러

 * @author  : PJC
 * @date    : 2026. 1. 13
 * @desc    :
 * @version : 1.0
 * @see
 *
 * 개정이력(Modification Information)
 * 수정일		      수정자	     내용
 * ----------------  --------  -----------------
 *  2026. 1. 13		PJC			최초생성
 **/

@Controller
@RequestMapping("/admin/main")
public class AdminMainController extends BaseController{
	/**
     * 메인 대시보드
     * @Method : index
     * @param request
     * @param response
     * @param throws
     * @throws Exception
     * @return : String
     */
	@PostMapping(value ="/index.do")
	public String loginRedirect(@RequestParam Map<String, Object> param
			, ModelMap model, HttpSession session) throws Exception {

		return adminLayout(model, "/WEB-INF/views/admin/main/index");

	}
}
