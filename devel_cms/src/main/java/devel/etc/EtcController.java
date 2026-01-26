package devel.etc;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/etc")
public class EtcController {
	/**
     * 로그인 화면 redirect
     * @Method : loginRedirect
     * @param request
     * @param response
     * @param throws
     * @throws Exception
     * @return : String
     */
	@GetMapping(value ="/jusoPop.do")
	public String loginRedirect(@RequestParam Map<String, Object> param
			, ModelMap model, HttpSession session) throws Exception {

		return "/etc/popup/jusoPop";

	}
}
