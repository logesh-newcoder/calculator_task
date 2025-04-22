package controller.calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

public class Cal_Ser extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String result = "";
        String n1 = req.getParameter("num1");
        String n2 = req.getParameter("num2");
        String op = req.getParameter("operator");

        try {
            if (n1 != null && n2 != null && op != null) {
                double a = Double.parseDouble(n1);
                double b = Double.parseDouble(n2);
                Cal_Res calc = new Cal_Res();

                result = calc.Cai_Res(a, b, op);
            } else {
                result = "Missing input";
            }
        } catch (Exception e) {
            result = "Invalid input";
        }

        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");

        Map<String, String> map = new HashMap<>();
        map.put("ans", result);
        String json = new Gson().toJson(map);

        res.getWriter().write(json);
    }
}
