package com.ddlab.rnd.security.oauth2;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class ProtectedController {
	
	@RequestMapping(value = "/test/test/{id}", method = RequestMethod.GET)
	@ResponseBody
	public String tokenManagment( @PathVariable("id") String id ) {
		System.out.println("********************ID*******************:::::"+id);
		return "You got protected information from server";
	}

}
