% Sum Square Difference:
% The sum of the squares of the first ten natural numbers is,
% 1^2 + 2^2 + ... + 10^2 = 385
% The square of the sum of the first ten natural numbers is,
% (1 + 2 + ... + 10)^2 = 55^2 = 3025
% Hence the difference between the sum of the squares of the
% first ten natural numbers and the square of the sum
% is 3025 - 385 = 2640.
% Find the difference between the sum of the squares of the
% first one hundred natural numbers and the square of the sum.

:- include('util.pl').

square(X, Result) :-
    XSquared = X ** 2,
    evaluate(XSquared, Result).

start(X, Result) :-
    do_list(square, X, XSquared),
    sum_list(XSquared, XSquaredSum),
    do_list(X, XList),
    sum_list(XList, XListSum),
    square(XListSum, XListSumSquared),
    Diff = XListSumSquared - XSquaredSum,
    evaluate(Diff, Result).

% gprolog
% ['0006'].
% start(10, Result).
% start(100, Result).
% 25164150.0
