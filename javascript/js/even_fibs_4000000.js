var fib_up_to = function (number) {
  var i1 = 1;
  var i2 = 1;
  var sum_of_evens = 0;
  var temp = 0;
  while (i1 <= number) {
    if (i1 % 2 === 0) {
      sum_of_evens += i1;
    }
    temp = i1;
    i1 = i2;
    i2 = temp + i2;
  }
  return sum_of_evens;
};

var nums = fib_up_to(4000000);
alert("sum is: " + nums);