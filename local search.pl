% Define variables and their domains
variable(x, [1, 2, 3]).
variable(y, [1, 2, 3]).

% Define constraints
constraint(X, Y) :- X \= Y.

% Check if assignment satisfies constraints
valid_assignment([(x, X), (y, Y)]) :-
    constraint(X, Y).

% Perform local search for a solution
local_search(Solution) :-
    variable(x, Dx), member(X, Dx), % Search for a value for x
    variable(y, Dy), member(Y, Dy), % Search for a value for y
    valid_assignment([(x, X), (y, Y)]), % Check constraints
    Solution = [(x, X), (y, Y)].

% Query: ?- local_search(Solution).
% Solution: Solution = [(x, 1), (y, 2)] ;
% Solution = [(x, 2), (y, 1)] ;
% Solution = [(x, 3), (y, 2)] ...
