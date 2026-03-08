right_triangle(Sides, Perimeter) :-
    Sides = [A, B, C],
    fd_domain(Sides, 1, Perimeter),
    Perimeter #= A + B + C,
    C**2 #= A**2 + B**2,
    A #< B,
    fd_labeling(Sides).

length_perimeter(L, P) :-
    findall(Sides, right_triangle(Sides, P), Bag),
    length(Bag, L).
