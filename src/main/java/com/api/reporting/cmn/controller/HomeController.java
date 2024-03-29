package com.api.reporting.cmn.controller;

import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.api.reporting.cmn.interceptor.Auth;
import com.api.reporting.cmn.service.UserService;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Auth
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale,Model model) {
		return "/home";
	}
	
}
