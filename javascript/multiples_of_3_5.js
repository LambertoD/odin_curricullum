var divisible_by_5_3 = function (number) {
    if ((number % 3 === 0) || (number % 5 === 0)) {
        return number;
    } else return 0;
     
};

var sum = 0;

for (var i = 1; i < 10; i++) {
    sum += divisible_by_5_3(i);
}
alert("Sum is: " + sum);
