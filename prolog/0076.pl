:- include('util.pl').

descending([]) :- !.
descending([_]) :- !.
descending([H1, H2|T]) :-
    H1 #>= H2,
    descending([H2|T]).

sum_vals(X, Y, S) :-
   S #= X + Y.

list_sum([H|T], S) :-
    foldl(sum_vals, T, H, S).

summation(List, Num) :-
    length(List, Num),
    Num0 #= Num - 1,
    fd_domain(List, 0, Num0),
    list_sum(List, Num),
    descending(List),
    fd_labeling(List).

start(Num, Len) :-
    findall(Num, summation(_, Num), Bag),
    length(Bag, Len).

% gprolog
% ['0076'].
% summation(List, 5).
% descending([3, 2, 1]).
% descending([3, 1, 2]).
% list_sum([1, 2, 3], S).
% start(5, Len).
% start(100, Len).
% 
