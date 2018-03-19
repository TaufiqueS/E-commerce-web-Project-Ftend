package com.niit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class PageController 
{

	@RequestMapping(value={"","/"})
	public String m1()
	{
		return "Home";
	}
	
	@RequestMapping(value="/Home")
	public String m2()
	{
	return "Home";
	}

	
	@RequestMapping("/Login")
	public String ShowLogin()
	{
		
		return "LoginPage";
	}
}

