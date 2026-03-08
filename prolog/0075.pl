:- include('util.pl').
:- include('triangle.pl').

is_one(I) :-
    1 =:= I.

start(Result) :-
    do_list(1500, Perimeter),
    maplist(length_perimeter, Solutions, Perimeter),
    include(is_one, Solutions, Included),
    length(Included, Result).


% setenv GLOBALSZ 1048564
% ['0075'].
% right_triangle(Sides, 12).
% right_triangle(Sides, 120).
