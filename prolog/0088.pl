:- include('util.pl').

product_sum(Size, Set, Num) :-
    % fd_set_vector_max(100000),
    length(Set, Size),
    fd_domain(Set, 1, Size),
    list_sum(Set, Num),
    list_mult(Set, Num),
    ascending(Set),
    fd_labeling(Set).

minimal_product_sum(Size, Min) :-
    findall(Num, product_sum(Size, _, Num), Bag),
    list_min(Bag, Min).

start(Result) :-
    do_list(6, Sizes),
    convlist(minimal_product_sum, Sizes, Minimal),
    sort(Minimal, SortedMinimal),
    list_sum(SortedMinimal, Result0),
    Result #= Result0 - 1.



% setenv TRAILSZ 1048564
% gprolog
% ['0088'].
% product_sum(2, Set, Num).
% product_sum(4, Set, Num).
% product_sum(5, Set, Num).
% minimal_product_sum(1000, Min).
