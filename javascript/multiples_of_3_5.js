var divisible_by_5_3 = function (number) {
    if ((number % 3 === 0) || (number % 5 === 0)) {
        return number;
    } else return 0;
     
};

var sum_of_multiples_of_3_5 = function (number) {
  var sum = 0;
  for (var i = 1; i < number; i++) {
    sum += divisible_by_5_3(i);
  }	
  return sum;
};

alert("Sum is: " + sum);
