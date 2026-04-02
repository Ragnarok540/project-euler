:- include('util.pl').

prime_triples(Sum, Triple) :-
    fd_set_vector_max(1000000),
    Triple = [C, B, A],
    fd_domain(Triple, 2, 9973),
    maplist(fd_prime, Triple),
    Sum #= A**2 + B**3 + C**4,
    % Sum #< 50000000,
    fd_labeling(Triple),
    fd_labeling(Sum).

start(Result) :-
    do_list(50000, Sums),
    convlist(prime_triples, Sums, Triples),
    length(Triples, Result).

% setenv CSTRSZ 524282
% setenv TRAILSZ 1048564
% gprolog
% ['0087'].
% prime_triples(Triple, Sum).
