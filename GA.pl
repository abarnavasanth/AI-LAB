% To find the maximum value of a function f(x) = x2 in the range [0,7]
% Simple Genetic Algorithm in Prolog

% Define the population and fitness function
initial_population([0, 1, 2, 3, 4, 5, 6, 7]).
fitness(X, F) :- F is X * X.

% Selection: Select top 4 based on fitness
selection(Pop, Sel) :- maplist(fitness, Pop, Fit), pairs_keys_values(Pairs, Fit, Pop), keysort(Pairs, Sorted), pairs_values(Sorted, SortedPop), reverse(SortedPop, RevSortedPop), append(Sel, _, RevSortedPop).

% Crossover: Create 2 offspring from 2 parents
crossover(P1, P2, C1) :- C1 is (P1 + P2) // 2.
crossover(P1, P2, C2) :- C2 is (P2 + 1) // 2.

% Mutation: Randomly mutate an offspring
mutation(C, M) :- random(0, 8, M), M \= C.

% Main loop
genetic_algorithm(Sol) :- initial_population(Pop), selection(Pop, Sel), Sel = [P1, P2 | _], crossover(P1, P2, C1), mutation(C1, Sol).
%Query
% - ? genetic_algorithm(Solution).
