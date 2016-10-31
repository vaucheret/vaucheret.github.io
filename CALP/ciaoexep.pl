

 p(_X) :- throw(error), display('---').
 p(X) :- display(X).

testcatch:- catch(p(0), E, display(E)), display(.), fail.

q(_X) :- send_signal(error), display('---').
q(X) :- display(X).

testintercept:- intercept(q(0), E, display(E)), display(.),fail.
