% Special Pythagorean Triplet:
% A Pythagorean triplet is a set of three natural
% numbers, a < b < c, for which
% a^2 + b^2 = c^2
% For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
% There exists exactly one Pythagorean triplet for which
% a + b + c = 1000.
% Find the product a * b * c

triplet_sum_product(Triplet, Sum, Product) :-
    Triplet = [A, B, C],
    fd_domain(Triplet, 1, Sum),
    C**2 #= A**2 + B**2,
    A #< B,
    Sum #= A + B + C,
    Product #= A * B * C,
    fd_labeling(Triplet).

start(Triplet, Product) :-
    triplet_sum_product(Triplet, 1000, Product).

% gprolog
% ['0009'].
% triplet_sum_product(Triplet, 1000, Product).
% Product = 31875000
% Triplet = [200,375,425]
