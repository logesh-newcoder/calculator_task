<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>JSP Calculator</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * { padding: 0; margin: 0; box-sizing: border-box; }
        body {
            min-height: 100vh;
            background-color: burlywood;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
        }
        .cal_box {
            width: 90%;
            max-width: 320px;
            background-color: white;
            padding: 1rem;
            border: 2px solid black;
            border-radius: 10px;
            display: grid;
            gap: 10px;
        }
        .one input {
            width: 100%;
            font-size: 1.1rem;
            padding: 10px;
            margin: 5px 0;
        }
        #result {
            font-size: 1.2rem;
            font-weight: bold;
            background: #f0f0f0;
            padding: 12px;
            border: 1px solid #aaa;
            text-align: center;
            color: #333;
        }
        .two {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
        }
        .two button, .two select {
            height: 50px;
            font-size: 1.1rem;
            cursor: pointer;
            border: none;
            background-color: #f3f3f3;
            border-radius: 8px;
            transition: background-color 0.2s ease;
        }
        .two button:hover {
            background-color: #d2d2d2;
        }
        @media screen and (max-width: 400px) {
            .two button, .two select {
                height: 45px;
                font-size: 1rem;
            }
            .one input {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>

<%
    String result = "";
    String db_result = "";
    String n1 = request.getParameter("num1");
    String n2 = request.getParameter("num2");
    String op = request.getParameter("operator");

    if (n1 != null && n2 != null && op != null && !n1.isEmpty() && !n2.isEmpty() && !op.isEmpty()) {
        try {
            double a = Double.parseDouble(n1);
            double b = Double.parseDouble(n2);

            switch (op) {
            case "+":
                result = (a + b) + "";
                break;
            case "-":
                result = (a - b) + "";
                break;
            case "*":
                result = (a * b) + "";
                break;
            case "/":
                if (b == 0)
                    result = "Error: Divide by zero";
                else
                    result = (a / b) + "";
                break;
            default:
                result = "Invalid operator";
            }
        } 
        catch (Exception e) {
            result = "Error in processing";
        }
    }
%>

<div class="cal_box">
    <form method="post" action="index.jsp" id="calcForm">
        <div class="one">
            <input type="text" name="num1" id="num1" placeholder="First Number" readonly>
            <input type="text" name="num2" id="num2" placeholder="Second Number" readonly>
            <input type="text" name="operator" id="operator" placeholder="Operator" readonly>
            <input type="text" value="<%= result %>" placeholder="Result" readonly id="result">
        </div>
        <div class="two">
            <button type="button" onclick="appendVal('1')">1</button>
            <button type="button" onclick="appendVal('2')">2</button>
            <button type="button" onclick="appendVal('3')">3</button>
            <button type="button" onclick="setOperator('+')">+</button>

            <button type="button" onclick="appendVal('4')">4</button>
            <button type="button" onclick="appendVal('5')">5</button>
            <button type="button" onclick="appendVal('6')">6</button>
            <button type="button" onclick="setOperator('-')">-</button>

            <button type="button" onclick="appendVal('7')">7</button>
            <button type="button" onclick="appendVal('8')">8</button>
            <button type="button" onclick="appendVal('9')">9</button>
            <button type="button" onclick="setOperator('*')">*</button>

            <button type="button" onclick="appendVal('0')">0</button>
            <button type="button" onclick="appendVal('.')">.</button>
            <button type="button" onclick="clearCalc()">C</button>
            <button type="button" onclick="setOperator('/')">/</button>

            <button type="submit" style="grid-column: span 4;">=</button>
        </div>
    </form>
</div>

<script>
    function appendVal(val) {
        const input1 = document.getElementById("num1");
        const input2 = document.getElementById("num2");
        const op = document.getElementById("operator");
        if (op.value === "") {
            input1.value += val;
        } else {
            input2.value += val;
        }
    }

    function setOperator(val) {
        const resultField = document.getElementById("result");
        const input1 = document.getElementById("num1");
        const input2 = document.getElementById("num2");
        const op = document.getElementById("operator");

        if (resultField.value !== "") {
            input1.value = resultField.value;
            input2.value = "";
            resultField.value = "";
        }
        op.value = val;
    }

    function clearCalc() {
        document.getElementById("num1").value = "";
        document.getElementById("num2").value = "";
        document.getElementById("operator").value = "";
        document.getElementById("result").value = "";
    }
</script>

</body>
</html>
