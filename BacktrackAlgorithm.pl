% N-Queens problem in Prolog

solve(N, Solution) :-
    length(Solution, N),
    maplist(between(1, N), Solution),
    safe(Solution).

safe([]).
safe([Q|Qs]) :-
    safe(Qs, Q, 1),
    safe(Qs).

safe([], _, _).
safe([Q|Qs], Q1, D) :-
    Q1 =\= Q,
    abs(Q1 - Q) =\= D,
    D1 is D + 1,
    safe(Qs, Q1, D1).

% Query: ?- solve(8, Solution).
