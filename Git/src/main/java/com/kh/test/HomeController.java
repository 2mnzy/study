package com.kh.test;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, ModelAndView mv){
		Naverservice service = new Naverservice();
		
		mv.setViewName("home");
		mv.addObject("list",service.searchBook("java", 20, 1));
		return mv;
	} 
	
	@RequestMapping(value = "search.minji", method = RequestMethod.GET)
	public ModelAndView search(HttpServletRequest request, ModelAndView mv){
		Naverservice service = new Naverservice();
		
		String keyword = request.getParameter("keyword");
		System.out.println("키워드"+keyword);
		
		mv.setViewName("home");
		mv.addObject("list",service.searchBook(keyword, 20, 1));
		return mv;
	} 
}
