package com.cafe.kiosk;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

	@RequestMapping(value = { "/admin_menuInsert", "/admin_menuDelete", "/admin_menuModify" })
	public String admin(HttpSession session, HttpServletRequest request) {
		UrlPathHelper urls = new UrlPathHelper();
		String url = urls.getOriginatingServletPath(request);
		String returnUrl = "";
		if ("/admin_menuInsert".equals(url)) {
			returnUrl = "admin/admin_menuInsert";
		} else if ("/admin_menuDelete".equals(url)) {
			returnUrl = "admin/admin_menuDelete";
		} else if ("/admin_menuModify".equals(url)) {
			returnUrl = "admin/admin_menuModify";
		}
		return returnUrl;
	}

	@RequestMapping(value = "/admin_menuInsert.do")
	public String insertmenu(HttpServletRequest request) {
		int a = MenuDao.getInstance().insertMenu(request);
		if (a == 1)
			return "user/menu_list";
		else
			return "admin/admin_menuInsert";
	}

	@RequestMapping(value = "/admin_menuDelete.do")
	public String deletemenu(HttpServletRequest request, @RequestParam String name) {
		int a = MenuDao.getInstance().deleteMenu(name);
		if (a == 1)
			return "admin/admin_menuDelete";
		else
			return "user/menu_list";
	}
}
