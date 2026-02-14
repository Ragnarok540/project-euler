start(List, N, Elem) :-
    findall(Perm, permutation(List, Perm), Bag),
    nth(N, Bag, Elem).

% setenv GLOBALSZ 1048564
% gprolog
% ['0024'].
% start([0,1,2,3,4,5,6,7,8,9], 1000000, Elem).
% Elem = [2,7,8,3,9,1,5,4,6,0]
