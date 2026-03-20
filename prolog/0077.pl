% Prime Summations:
% It is possible to write ten as the sum of primes in exactly five
% different ways:
% List = [5,5] ? ;
% List = [7,3] ? ;
% List = [5,3,2] ? ;
% List = [3,3,2,2] ? ;
% List = [2,2,2,2,2] ? ;
% What is the first value which can be written as the sum of primes
% in over five thousand different ways?

:- include('util.pl').

summation_prime(Num, List) :-
    fd_set_vector_max(100000),
    Max #= Num // 2,
    do_list(2, Max, Lens),
    member(Len, Lens),
    length(List, Len),
    maplist(fd_prime, List),
    list_sum(List, Num),
    descending(List),
    fd_domain(List, 2, Num),
    fd_labeling(List),
    fd_labeling(Len).

summation_prime_catch(Num, List) :-
    catch(summation_prime(Num, List), error(type_error(callable,2),call/3), !).

start(Num, Len) :-
    findall(Num, summation_prime_catch(Num, _), Bag),
    length(Bag, Len0),
    Len #= Len0 - 1.

% setenv GLOBALSZ 1048564
% gprolog
% ['0077'].
% summation_prime(10, List).
% summation_prime_catch(10, List).
% start(10, Len).
% start(71, Len).
% Len = 5006
