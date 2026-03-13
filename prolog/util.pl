do_list(N, L):-
    findall(Num, between(1, N, Num), L).

do_list(Goal, Length, List) :-
    do_list(Length, Nums),
    maplist(Goal, Nums, List).

% do_list(10, List).

include(_Goal, [], []).
include(Goal, [Head|Tail], Included) :-
    include(Goal, Tail, IncludedSoFar),
    ( call(Goal, Head)
    -> Included = [Head|IncludedSoFar]
    ; Included = IncludedSoFar
    ).

is_odd(I) :-
    0 =\= I mod 2.

is_even(I) :-
    0 =:= I mod 2.

% include(is_odd, [1,2,3,4,5,6], Result).

exclude(_Goal, [], []).
exclude(Goal, [Head|Tail], Included) :-
    exclude(Goal, Tail, IncludedSoFar),
    ( call(Goal, Head)
    -> Included = IncludedSoFar 
    ; Included = [Head|IncludedSoFar]
    ).

% exclude(is_odd, [1,2,3,4,5,6], Result).

subseq([], []).
subseq([_|Xs], Ys) :-
    subseq(Xs, Ys).
subseq([X|Xs], [X|Ys]) :-
    prefix_subseq(Xs, Ys).

prefix_subseq(_, []).
prefix_subseq([X|Xs], [X|Ys]) :-
    prefix_subseq(Xs, Ys).

% subseq([2,3,5,7], Result).

evaluate(X, R):- R is X.

count(Goal, List, Count) :-
    include(Goal, List, Included),
    length(Included, Count), !.

% count(is_odd, [1,2,3,4,5,6], Count).

equal_lengths([]).
equal_lengths([[]]).
equal_lengths([[_|_]]).
equal_lengths([X,Y|Rest]) :- 
    length(X, Len), 
    length(Y, Len), 
    equal_lengths([Y|Rest]).

transpose([[]|_], []).
transpose(Matrix, [Row|Rows]) :-
    transpose_1st_col(Matrix, Row, RestMatrix),
    transpose(RestMatrix, Rows).
transpose_1st_col([], [], []).
transpose_1st_col([[H|T]|Rows], [H|Hs], [T|Ts]) :-
    transpose_1st_col(Rows, Hs, Ts).
