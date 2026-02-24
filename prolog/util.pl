do_list(N, L):-
    findall(Num, between(1, N, Num), L).

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

% include(is_odd, [1,2,3,4,5,6], Result).

subseq([], []).
subseq([_|Xs], Ys) :-
    subseq(Xs, Ys).
subseq([X|Xs], [X|Ys]) :-
    prefix_subseq(Xs, Ys).

prefix_subseq(_, []).
prefix_subseq([X|Xs], [X|Ys]) :-
    prefix_subseq(Xs, Ys).

% subseq([2,3,5,7], Result).
