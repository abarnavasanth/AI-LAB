% Example Knowledge Base
parent(john, mary).      % John is Mary’s parent.
parent(mary, susan).     % Mary is Susan’s parent.
ancestor(X, Y) :- parent(X, Y).     % Rule: A parent is an ancestor.
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y). % Recursive rule: Transitive relation.

% Resolution and Inference
infer(Query) :-
    (call(Query) -> write('True: '), write(Query), nl;
     write('False: '), write(Query), nl).
%?-infer(ancestor(john, susan)).
%Output: True: ancestor(john, susan)
%?- infer(ancestor(mary, john)).
%Output: False: ancestor(mary, john)

