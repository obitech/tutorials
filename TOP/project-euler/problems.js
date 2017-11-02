// PROBLEM 1

var sum = function(x){
    sum = 0;
    for (i=1; i<x; i++) {
        if ((i % 3 === 0) || (i % 5 === 0)) {
        sum += i; 
        }
    }
    return sum;
};

 sum(1000);

//PROBLEM 2

var fibo = function(n) {
    var a = 0, b = 1, fibnr = 1, solution = 0;
    for(var i = 1; fibnr <= n; i++) {
        fibnr = a + b;
        a = b;
        b = fibnr;
        if (fibnr % 2 === 0) {
            solution += fibnr;
        }
    }
    console.log(solution, fibnr);
};

fibo(4000000);

// PROBLEM 3

var largePrimeFac = function(input) {
    var facArray = [];
    var divider = 2;
    while (input > 1) {
        while ((input % divider === 0)) {
            facArray.push(divider);
            input /= divider;
        }
        divider += 1;
    }
    console.log(facArray); //displays all the factors
    console.log(facArray[facArray.length-1]); //displays just the biggest prime factor
};

largePrimeFac(600851475143);