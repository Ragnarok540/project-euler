% Lexicographic Permutations:
% A permutation is an ordered arrangement of objects. For example, 3124 is
% one possible permutation of the digits 1, 2, 3 and 4. If all of the
% permutations are listed numerically or alphabetically, we call it
% lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
% 012   021   102   120   201   210
% What is the millionth lexicographic permutation of the digits 0, 1, 2, 3,
% 4, 5, 6, 7, 8 and 9?

start(List, N, Elem) :-
    findall(Perm, permutation(List, Perm), Bag),
    nth(N, Bag, Elem).

% setenv GLOBALSZ 1048564
% gprolog
% ['0024'].
% start([0,1,2,3,4,5,6,7,8,9], 1000000, Elem).
% Elem = [2,7,8,3,9,1,5,4,6,0]
