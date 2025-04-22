<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>JSP Calculator</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="cal_box">
    <form id="calcForm">
        <div class="one">
            <input type="text" name="num1" id="num1" placeholder="First Number" readonly>
            <input type="text" name="num2" id="num2" placeholder="Second Number" readonly>
            <input type="text" name="operator" id="operator" placeholder="Operator" readonly>
            <input type="text" id="result" placeholder="Result" readonly>
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

            <button type="button" style="grid-column: span 4;" onclick="calculate()">=</button>
        </div>
    </form>
</div>

<script src="scripts.js"></script>
</body>
</html>
