% If X is a man, then X is mortal.
% If X is a philosopher, then X is a man.
% If X is an animal, then X is not a man.
% If X is a man, then X is animal.
%
% Socrates is a philosopher.
% Wilbur is a pig.

mortal(X) :- man(X).
man(X) :- philosopher(X).
not(man(X)) :- animal(X).
animal(X) :- man(X).

philosopher(socrates).
pig(wilbur).
