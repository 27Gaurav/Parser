brother('John',is(X,3)).
brother(brother(X,Z),Y) :- brother(X,true),brother(Y,'John').
?- is(X).



