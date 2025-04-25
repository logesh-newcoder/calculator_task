package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Re_Req;

public class Re_Ser extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
		
		res.setContentType("text/plain");
		
		try {
			String num1=req.getParameter("num1");
			String num2=req.getParameter("num2");
			String oper=req.getParameter("oper");
			String result="";
			
			if(num1 != null && num2 != null) {
				 double a = Double.parseDouble(num1);
	             double b = Double.parseDouble(num2);
	             Re_Req calc = new Re_Req();
	        
	             result = calc.Cai_Res(a, b, oper);
	             res.getWriter().write(result);
	         } else {
	             result = "Missing input";
	         }
		}catch(Exception e) {
			
		}
	}
}
