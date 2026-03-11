:- include('util.pl').

separate_number_4(Original, FirstTwo, LastTwo) :-
    Original = [A, B, C, D],
    fd_domain(Original, 0, 9),
    FirstTwo = [A, B],
    LastTwo = [C, D],
    fd_labeling(Original).

number_list_4(Number, List) :-
    List = [A, B, C, D],
    fd_domain(List, 0, 9),
    fd_domain(Number, 0, 9999),
    Number #= D + 10 * C + 100 * B + 1000 * A,
    fd_labeling(List).

triangular(P, N) :-
    fd_domain([P, N], 1, 9999),
    N #= P * (P + 1) / 2,
    fd_labeling([P, N]).

square(P, N) :-
    fd_domain([P, N], 1, 9999),
    N #= P * P,
    fd_labeling([P, N]).

pentagonal(P, N) :-
    fd_domain([P, N], 1, 9999),
    N #= P * (3 * P - 1) / 2,
    fd_labeling([P, N]).

is_triangular(N) :-
    fd_domain([P, N], 1, 9999),
    N #= P * (P + 1) / 2,
    fd_labeling([P, N]).

is_square(N) :-
    fd_domain([P, N], 1, 9999),
    N #= P * P,
    fd_labeling([P, N]).

is_pentagonal(N) :-
    fd_domain([P, N], 1, 9999),
    N #= P * (3 * P - 1) / 2,
    fd_labeling([P, N]).

start(Set, T, P, S) :-
    Set = [Num1, Num2, Num3],
    triangular(T, Num1),
    pentagonal(P, Num2),
    square(S, Num3),
    fd_domain(Set, 1000, 9999),
    number_list_4(Num1, Ls1),
    number_list_4(Num2, Ls2),
    number_list_4(Num3, Ls3),
    separate_number_4(Ls1, Ls1a, Ls1b),
    separate_number_4(Ls2, Ls2a, Ls2b),
    separate_number_4(Ls3, Ls3a, Ls3b),
    Ls1b = Ls2a,
    Ls2b = Ls3a,
    Ls3b = Ls1a,
    % count(is_triangular, Set, 1),
    % count(is_square, Set, 1),
    % count(is_pentagonal, Set, 1),
    fd_labeling(Set).

% gprolog
% ['0061'].
% separate_number_4([8, 1, 2, 8], FirstTwo, LastTwo).
% number_list_4(8182, List).
% number_list_4(Number, [8, 1, 2, 8]).
