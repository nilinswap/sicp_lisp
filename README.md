# SICP Exercies

Hey, I am just learning [in a bigger scheme of things](https://web.mit.edu/6.001/6.037/sicp.pdf). 

[Great He](https://codology.net/)

## Comments

1-3 - write largest two without using min
1-4 - if/else over operation? is it function or data?
1-16 and 1-18 teaches to use loop invariant.

1-26 and 1-28 - exponentiation and prime

1-29 - high order functions for integration. in here I was trying to define h as a function but ended up defining a local variable. Soon realised they are same in this context. Moment of Truth(MOT)!!

1-30 - extended 1-29 but then formed another function twoFunEqual which seems like magic now. It is hard to differ a function from data. MOT2

1-32 - accumulator - third order function. 

1-39 - forces to create a speacial lambda which is just a dummy. tan-cf becomes a half implementation of cont-frac. Almost like an interface implementation. 

sqrt - It is real thing to understand this. Like what does it mean to return a procedure. Imagine looking at average-damp or derivative as to when return is a value and when it is a procedure. 

1-41 - A challenge for the understanding. 

A simpler to understand proof is here

![proof of (double (double double))] (proof_1-41.jpg)

But a more sound proof is 

![proof_1-41_2.jpg](proof_1-41_2.jpg)

See this proof. in proof_1-41.jpg. 

Let's notice some important things. 
    - double, (double double) and (double (double double)). All three of them, always maintained their functional nature which is the same as that of double. why? it's because double in its definition ensures this.
    
    - They were always a procedure      
        - which took only one argument which is again a procedure - returned a procedure which is of same nature as that of argument procedure. 

    - Notice a stark difference between inc and double. 
        - inc can only be applied on data. and double can only be applied on procedure. 
        - double argument's Nature of procedure is that it should take only one argument. in a way double itself takes only one argument therefore (double double) is valid!! and (double double) also takes and outputs a function of one argument so (double (double double)) or ((double double) (double double)) are all valid. Amazing thing to notice is double is quite non-chalant. 

        - Like (double 1), (double (inc 2)) or (inc double) are all meaningless.  (inc (inc 1)) and (double (double inc)) both make sense.(double double) makes sense but (inc inc) or ((inc 1) (inc 1)) doesn't. 

    - (double inc) would return a procedure of some functional nature as inc (i.e it can only be applied to data)

    - (double double) whould also adhere to it and so would (double (double double)). with inc's context, double returns a procedure which can work on data (like inc itself). (double double) 
    should adhere to nature of double so (double double) returns a procedure which can work on data. and similarily (double (double double)) should adhere to nature of (double double) and therefore it also returns a procedure which can work on data. 


1-43 - A recursive order function. Understand how one can make nth order procedures. One idea is to always keep in mind the function signature. A procedure returning a procedure will always return a signature. 

1-44 - this use of nthfr from previous exercise blew my mind. 




