% Multiples of 3 or 5:
% If we list all the natural numbers below 10 that
% are multiples of 3 or 5, we get 3, 5, 6 and 9.
% The sum of these multiples is 23.
% Find the sum of all the multiples of 3 or 5 below 1000.

:- include('util.pl').

is_multiple(I) :-
    0 =:= I mod 3;
    0 =:= I mod 5.

start(SumMultiples, Limit) :-
    Limit0 #= Limit - 1,
    do_list(Limit0, List),
    include(is_multiple, List, ListMultiple),
    sum_list(ListMultiple, SumMultiples).

% gprolog
% ['0001'].
% start(SumMultiples, 10).
% start(SumMultiples, 1000).
% 233168
