reciprocal_diophantine(N, X, Y) :-
    Vars = [X, Y],
    fd_domain(Vars, 1, 25),
    N * (X + Y) #= X * Y,
    Y #>= X,
    fd_labeling(Vars).

% ['0108'].
% reciprocal_diophantine(4, X, Y).
