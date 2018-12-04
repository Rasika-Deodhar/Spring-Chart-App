package com.controllers;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jdbc.DatabaseControl;

@Controller
public class HomeController {

	@Autowired
	DatabaseControl databaseControl;
	@RequestMapping("/home")
	public String home() throws SQLException{
		//databaseControl.connect();
		
		
		
		//mnv.addObject(m);
		return "home";
	}
	
	@RequestMapping("/getGraphData")
	public @ResponseBody String getData() throws SQLException, JsonProcessingException{
		ObjectMapper mapper = new ObjectMapper();
		
		String jsonString = mapper.writeValueAsString(databaseControl.connect());
		//System.out.println(jsonString);
		return  jsonString;
	}
	
	
}
