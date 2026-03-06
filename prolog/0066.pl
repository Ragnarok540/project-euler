
:- include('util.pl').

quadratic_diophantine(D, X, Y) :-
    Vars = [X, Y],
    fd_max_integer(Max),
    fd_domain(Vars, 1, Max),
    1 #= X**2 - D * Y**2,
    fd_labeling(Vars).

is_square(I) :-
    fd_max_integer(Max),
    fd_domain([I, J], 1, Max),
    I #= J * J,
    fd_labeling([I]).

start(Result, DListClean, Xs) :-
    do_list(45, DList),
    exclude(is_square, DList, DListClean),
    maplist(quadratic_diophantine, DListClean, Xs, _),
    max_list(Xs, MaxX),
    nth(N, Xs, MaxX),
    nth(N, DListClean, Result), !.

% gprolog
% ['0066'].
% quadratic_diophantine(13, X, Y).
% exclude(is_square, [1,2,3,4,5,6,7], Result).
% start(Result, DListClean, Xs).
% https://en.wikipedia.org/wiki/Pell%27s_equation
