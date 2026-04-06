:- include('util.pl').

subset([], []).
subset([H|T1], [H|T2]) :-
    subset(T1, T2).
subset([_|T1], T2) :-
    subset(T1, T2).

% subset([1,2,3], X).

disjoint([], _).
disjoint([H|T], K) :-
    \+ member(H, K),
    disjoint(T, K).

% disjoint([1,2,3], [4,5,6]).

disjoint_subsets(Set, SubSetB, SubSetC) :-
    subset(Set, SubSetB),
    subset(Set, SubSetC),
    length(Set, Length),
    \+ length(SubSetB, Length),
    \+ length(SubSetB, 0),
    \+ length(SubSetC, Length),
    \+ length(SubSetC, 0),
    disjoint(SubSetB, SubSetC),
    append(SubSetB, SubSetC, SetBC),
    sum_list(SetBC, Num),
    sum_list(Set, Num).

% disjoint_subsets([1,2,3], B, C).

% special_set(Set, Sum) :-
% .

% ['0103'].


%       1* 0
%      1  2*
%     2  3*  4
%    3  5   6*  7
%   6  9  11* 12  13
% 11 18 19  20* 22  25

% 1: 1
% 2: 2
% 3: 2
% 4: 3
% 5: 3
% 6: 4
% 7: 4