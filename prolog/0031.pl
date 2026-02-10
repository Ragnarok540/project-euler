% Coin Sums:
% In the United Kingdom the currency is made up of pound (£) and
% pence (p). There are eight coins in general circulation:
% 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p), and £2 (200p).
% It is possible to make £2 in the following way:
% 1 * £1 + 1 * 50p + 2 * 20p + 1 * 5p + 1 * 2p + 3 * 1p
% How many different ways can £2 be made using any number of coins?

coin_sum(Coins, Value) :-
    Coins = [Pence1, Pence2,
             Pence5, Pence10,
             Pence20, Pence50,
             Pound1, Pound2],
    fd_domain(Coins, 0, Value),
    Value #= Pound2 * 200 +
             Pound1 * 100 +
             Pence50 * 50 +
             Pence20 * 20 +
             Pence10 * 10 +
             Pence5 * 5 +
             Pence2 * 2 +
             Pence1,
    fd_labeling(Coins).

start(Value, L) :-
    findall(Coins, coin_sum(Coins, Value), Bag),
    length(Bag, L).

% gprolog
% ['0031'].
% coin_sum(Coins, 200).
% start(200, L).
% 73682
