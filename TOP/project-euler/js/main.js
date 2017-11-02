// PROBLEM 1
var sum1 = function (x) {
    var x = document.getElementById("input1").value;
    var sum = 0;
    for (i = 1; i < x; i++) {
        if ((i % 3 === 0) || (i % 5 === 0)) {
        sum += i; 
        }
    }
    document.getElementById("result1").innerHTML = sum;
};

//PROBLEM 2
var fibo = function(n) {
    var n = document.getElementById("input2").value;
    var a = 0, b = 1, fibnr = 1, solution = 0;
    for(var i = 1; fibnr <= n; i++) {
        fibnr = a + b;
        a = b;
        b = fibnr;
        if (fibnr % 2 === 0) {
            solution += fibnr;
        }
    }
    document.getElementById("result2").innerHTML = solution;
};

// PROBLEM 3
var largePrimeFac = function(input) {
    var input = document.getElementById("input3").value;    
    var facArray = [];
    var divider = 2;
    while (input > 1) {
        while ((input % divider === 0)) {
            facArray.push(divider);
            input /= divider;
        }
        divider += 1;
    }
    document.getElementById("result3").innerHTML = facArray[facArray.length-1]
};