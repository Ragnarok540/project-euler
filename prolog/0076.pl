:- include('util.pl').

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
% start(5, Len).
% start(100, Len).
% 
