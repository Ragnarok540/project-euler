% Magic 5-gon Ring:
% Consider the following "magic" 3-gon ring, filled with the numbers
% 1 to 6, and each line adding to nine.
% Working clockwise, and starting from the group of three with the
% numerically lowest external node (4,3,2 in this example), each
% solution can be described uniquely. For example, the above solution
% can be described by the set: 4,3,2; 6,2,1; 5,1,3.
% It is possible to complete the ring with four different totals:
% 9, 10, 11, and 12. There are eight solutions in total.
% Total	Solution Set
% 9       4,2,3; 5,3,1; 6,1,2
% 9       4,3,2; 6,2,1; 5,1,3
% 10      2,3,5; 4,5,1; 6,1,3
% 10      2,5,3; 6,3,1; 4,1,5
% 11      1,4,6; 3,6,2; 5,2,4
% 11      1,6,4; 5,4,2; 3,2,6
% 12      1,5,6; 2,6,4; 3,4,5
% 12      1,6,5; 3,5,4; 2,4,6
% By concatenating each group it is possible to form 9-digit strings;
% the maximum string for a 3-gon ring is 432621513.
% Using the numbers 1 to 10, and depending on arrangements, it is
% possible to form 16- and 17-digit strings. What is the maximum
% 16-digit string for a "magic" 5-gon ring?

magic_3gon_ring(Ring, Solution, Sum) :-
    Ring = [A, B, C, D, E, F],
    Solution = [[A, D, E], [B, E, F], [C, F, D]],
    fd_domain(Ring, 1, 6),
    fd_all_different(Ring),
    A #< B,
    A #< C,
    Sum #= A + D + E,
    Sum #= B + E + F,
    Sum #= C + F + D,
    fd_labeling(Ring).

magic_5gon_ring(Ring, Solution, Sum) :-
    Ring = [A, B, C, D, E, F, G, H, I, J],
    Solution = [[A, F, G], [B, G, H], [C, H, I], [D, I, J], [E, J, F]],
    Limit #= 10,
    fd_domain(Ring, 1, Limit),
    fd_all_different(Ring),
    A #< B,
    A #< C,
    A #< D,
    A #< E,
    (
        A #= Limit;
        B #= Limit;
        C #= Limit;
        D #= Limit;
        E #= Limit
    ),
    Sum #= A + F + G,
    Sum #= B + G + H,
    Sum #= C + H + I,
    Sum #= D + I + J,
    Sum #= E + J + F,
    fd_labeling(Ring).

% gprolog
% ['0068'].
% magic_3gon_ring(Ring, Solution, Sum).
% magic_5gon_ring(Ring, Solution, Sum).
% [[6,5,3],[10,3,1],[9,1,4],[8,4,2],[7,2,5]]
% 6531031914842725
