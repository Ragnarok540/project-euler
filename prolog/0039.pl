% Integer Right Triangles:
% If p is the perimeter of a right angle triangle with integral length
% sides, [A, B, C], there are exactly three solutions for p = 120.
% [20,48,52],[24,45,51],[30,40,50]
% For which value of p <= 1000, is the number of solutions maximised?

right_triangle(Sides, Perimeter) :-
    Sides = [A, B, C],
    fd_domain(Sides, 1, Perimeter),
    Perimeter #= A + B + C,
    C**2 #= A**2 + B**2,
    A #< B,
    fd_labeling(Sides).

do_list(N, L):-
    findall(Num, between(1, N, Num), L).

length_perimeter(L, P) :-
    findall(Sides, right_triangle(Sides, P), Bag),
    length(Bag, L).

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
