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
       const num1 = encodeURIComponent(document.getElementById("num1").value);
       const num2 = encodeURIComponent(document.getElementById("num2").value);
       const operator = encodeURIComponent(document.getElementById("operator").value);

       const url = `Cal_Ser?num1=${num1}&num2=${num2}&operator=${operator}`;

       fetch(url, {
           method: "POST"
       })
       .then(response => response.json())
       .then(data => {
           document.getElementById("result").value = data.ans;
       })
       .catch(error => {
           console.error("Error:", error);
           alert("Error processing request");
       });
   }

