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

function calculate() {
		const num1 = document.getElementById("num1");
	    const num2 = document.getElementById("num2");
	    const oper = document.getElementById("operator");
		const tot=document.getElementById("result");

		$.ajax({
			url : "Re_Ser",
			method : "POST",
			data: {
			    num1: num1.value,
			    num2: num2.value,
			    oper: oper.value
			},
			success : (data)=>{
				tot.value = data;
			},
			error : (error)=>{
				tot.value = data;
			}
		});
}

