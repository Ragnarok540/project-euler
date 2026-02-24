% Consecutive Prime Sum:
% The prime 41, can be written as the sum of six consecutive primes:
% 41 = 2 + 3 + 5 + 7 + 11 + 13
% This is the longest sum of consecutive primes that adds to a prime
% below one-hundred.
% The longest sum of consecutive primes below one-thousand that adds
% to a prime, contains 21 terms, and is equal to 953.
% Which prime, below one-million, can be written as the sum of the
% most consecutive primes?

:- include('util.pl').

primes(Prime, Min, Max) :-
    fd_set_vector_max(1000000),
    fd_domain([Prime, Min, Max], 2, 1000000),
    fd_prime(Prime),
    Prime #>= Min,
    Prime #=< Max,
    fd_labeling([Prime, Min, Max]).

prime_list(PrimeBag, Min, Max) :-
    findall(Prime, primes(Prime, Min, Max), PrimeBag).

prime_subseq(SubSeqs, Min, Max) :-
    prime_list(PrimeBag, Min, Max),
    findall(R, subseq(PrimeBag, R), SubSeqs).

list_pair(Ls, L-Ls) :-
    length(Ls, L).

sort_list(Ls, Result) :-
    maplist(list_pair, Ls, Pairs0),
    keysort(Pairs0, Pairs),
    reverse(Pairs, Result0),
    maplist(list_pair, Result, Result0).

start(Result, Min, Max) :-
    prime_subseq(SubSeqs, Min, Max),
    sort_list(SubSeqs, SortedSubSeqs),
    maplist(sum_list, SortedSubSeqs, SeqSums),
    include(fd_prime, SeqSums, PrimeSums),
    [Result|_] = PrimeSums.

% setenv GLOBALSZ 1048564
% gprolog
% ['0050'].
% primes(P, 2, 13).
% prime_list(Bag, 2, 13).
% start(PrimeSum, 2, 4000).
% 997651
