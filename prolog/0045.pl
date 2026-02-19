% tri_pen_hex(T, P, H, N) :-
%     Triplet = [T, P, H],
%     fd_max_integer(Max),
%     fd_domain(Triplet, 1, 10000000000),
%     fd_domain([N], 1, 10000000000),
%     N #> 1,
%     N #= T * (T + 1) / 2,
%     N #= P * (3 * P - 1) / 2,
%     N #= H * (2 * H - 1),
%     fd_labeling([T, P, H, N]).

% gprolog
% ['0045'].
% tri_pen_hex(Triplet, N).
% tri_pen_hex(T, P, H, N).
% 268435455
% 1533776805
% 10000000000
