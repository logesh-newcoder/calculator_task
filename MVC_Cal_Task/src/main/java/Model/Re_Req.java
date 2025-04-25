package Model;

public class Re_Req {
	public String Cai_Res(double a, double b, String op) {
        String result = "";
        switch (op) {
            case "+":
                result = a + b + "";
                break;
            case "-":
                result = a - b + "";
                break;
            case "*":
                result = a * b + "";
                break;
            case "/":
                if (b == 0)
                    result = "Error: Divide by zero";
                else
                    result = a / b + "";
                break;
            default:
                result = "Invalid operator";
        }
        return result;
    }
}
