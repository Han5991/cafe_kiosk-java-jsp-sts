package com.cafe.kiosk;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UrlPathHelper;

import com.model.dao.MenuDao;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/loginProcess.do", method = RequestMethod.POST)
	public String loginProcess(@RequestParam String id, HttpServletRequest request) {

		logger.info("Welcome " + id);
		ChatClient.getinstance().setName(id);

		if (id.equals("admin"))
			return "admin/oderlist";
		else
			return "user/menu_list";
	}

	@RequestMapping(value = { "/admin_menuInsert", "/admin_menuDelete", "/admin_menuModify", "/admin_menuModify.do", })
	public String admin(HttpServletRequest request) {
		UrlPathHelper urls = new UrlPathHelper();
		String url = urls.getOriginatingServletPath(request);
		String returnUrl = "";
		if ("/admin_menuInsert".equals(url)) {
			returnUrl = "admin/admin_menuInsert";

		} else if ("/admin_menuDelete".equals(url)) {
			returnUrl = "admin/admin_menuDelete";

		} else if ("/admin_menuModify".equals(url)) {
			returnUrl = "admin/admin_menuModify";

		} else if ("/admin_menuModify.do".equals(url)) {
			returnUrl = "admin/admin_menuModifyOK";
		}

		return returnUrl;
	}

	@RequestMapping(value = "/admin_menuInsert.do")
	public String insertmenu(HttpServletRequest request) {
		int a = MenuDao.getInstance().insertMenu(request);
		if (a == 1) {
			logger.info("삽입 성공");
			return "user/menu_list";
		} else
			return "admin/admin_menuInsert";
	}

	@RequestMapping(value = "/admin_menuDelete.do")
	public String deletemenu(HttpServletRequest request, @RequestParam String name) {
		int a = MenuDao.getInstance().deleteMenu(name);

		if (a == 1) {
			logger.info("삭제 성공");
			return "admin/admin_menuDelete";
		} else
			return "user/menu_list";
	}

	@RequestMapping(value = "/admin_menuModifyOK.do")
	public String updatemenu(HttpServletRequest request) {
		int a = MenuDao.getInstance().updateMenu(request);
		if (a == 1) {
			logger.info("수정 성공");
			return "user/menu_list";
		} else
			return "admin/admin_menuModify";
	}

	@RequestMapping(value = { "/Cart.do","/oder.do" })
	public String user(HttpServletRequest request) {
		UrlPathHelper urls = new UrlPathHelper();
		String url = urls.getOriginatingServletPath(request);
		String returnUrl = "";
		if ("/Cart.do".equals(url)) {
			returnUrl = "user/Cart";
		} else if ("/oder.do".equals(url)) {
			returnUrl = "user/Payment_Result";
		}
//		} else if ("/admin_menuModify".equals(url)) {
//			returnUrl = "admin/admin_menuModify";
//
//		} else if ("/admin_menuModify.do".equals(url)) {
//			returnUrl = "admin/admin_menuModifyOK";
//		}

		return returnUrl;
	}
}
