alphabeta(Node, Depth, Alpha, Beta, BestValue) :-
    Depth =:= 0, value(Node, BestValue), !.
alphabeta(Node, Depth, Alpha, Beta, BestValue) :-
    Depth > 0, findall(Child, move(Node, Child), Children),
    evaluate(Children, Depth, Alpha, Beta, BestValue, -inf).

evaluate([], _, Alpha, _, Alpha, _).
evaluate([Child|Rest], Depth, Alpha, Beta, BestValue, Max) :-
    NewDepth is Depth - 1,
    alphabeta(Child, NewDepth, Alpha, Beta, Value),
    NewAlpha is max(Alpha, Value),
    (NewAlpha >= Beta -> BestValue = NewAlpha ; evaluate(Rest, Depth, NewAlpha, Beta, BestValue, Max)).
% Define terminal node values
value(a, 3).
value(b, 5).
value(c, 6).
value(d, 9).
value(e, 1).
value(f, 2).
value(g, 0).
value(h, -1).

% Define tree structure (move(Parent, Child))
move(root, n1).
move(root, n2).
move(n1, a).
move(n1, b).
move(n1, c).
move(n2, d).
move(n2, e).
move(n2, f).
move(n2, g).
move(n2, h).
% Query
% -? alphabeta(root, 3, -inf, inf, BestValue).
