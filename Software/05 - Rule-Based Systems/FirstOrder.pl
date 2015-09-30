% If X is a man, then X is mortal.
% If X is a philosopher, then X is a man.
% If X is not a man, then X is animal.
%
% Socrates is a philosopher.
% Wilbur is a pig.

mortal(X) :- man(X).
man(X) :- philosopher(X).
animal(X) :- not(man(X)).
tasty(X) :- pig(X).

philosopher(socrates).
pig(wilbur).
