function sieve(n) 
{
  var a = new Int8Array(n+1);
  var max = Math.floor(Math.sqrt(n));
  var p = 2;
  var prime_factors = [];
  var original_n = n;
  while(p <= max) {
    for(var i = 2*p; i <= n; i +=p)
      a[i] = 1;
    while(a[++p]);
  }
  while(n > 1){
    if(!a[n] && original_n % n === 0) {
      prime_factors.push(n);      
    }    
    n--;
  }
  return prime_factors;
  
}
alert("answer: " + sieve(999999));