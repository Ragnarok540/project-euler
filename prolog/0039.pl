% Integer Right Triangles:
% If p is the perimeter of a right angle triangle with integral length
% sides, [A, B, C], there are exactly three solutions for p = 120.
% [20,48,52],[24,45,51],[30,40,50]
% For which value of p <= 1000, is the number of solutions maximised?

:- include('util.pl').
:- include('triangle.pl').

start(Solutions, Perimeter, Result) :-
    do_list(1000, Perimeter),
    maplist(length_perimeter, Solutions, Perimeter),
    max_list(Solutions, MaxSolution),
    nth(N, Solutions, MaxSolution),
    nth(N, Perimeter, Result).

% gprolog
% ['0039'].
% right_triangle(Sides, 120).
% do_list(5, L).
% start(Solutions, Perimeter, Result).
% 840
