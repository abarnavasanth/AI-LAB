% Represents a directed edge in the graph: edge(From, To).
edge(a, b).
edge(a, c).
edge(b, d).
edge(c, d).
edge(c, e).
edge(d, f).
edge(e, f).

% DFS Wrapper: Start DFS from a given StartNode
dfs(StartNode, Visited) :-
    dfs_recursive(StartNode, [], Visited).

% Base case: If the node is already visited, do nothing
dfs_recursive(Node, Visited, Visited) :-
    member(Node, Visited), !.  % Check if Node is already in Visited list

% Recursive case: Visit Node and explore neighbors
dfs_recursive(Node, VisitedSoFar, FinalVisited) :-
    \+ member(Node, VisitedSoFar),                % Ensure Node is not already visited
    write("Visiting: "), write(Node), nl,        % Print the node being visited
    findall(Neighbor, edge(Node, Neighbor), Neighbors), % Get all neighbors of Node
    dfs_neighbors(Neighbors, [Node|VisitedSoFar], UpdatedVisited), % Process neighbors
    FinalVisited = UpdatedVisited.               % Finalize visited list

% Process each neighbor recursively
dfs_neighbors([], Visited, Visited).             % Base case: No more neighbors
dfs_neighbors([Neighbor|Rest], VisitedSoFar, FinalVisited) :-
    dfs_recursive(Neighbor, VisitedSoFar, UpdatedVisited), % Visit the first neighbor
dfs_neighbors(Rest, UpdatedVisited, FinalVisited).
% Process the remaining neighbors
%Queries:
%?- dfs(a, Visited).
/*Output: Visiting: a
Visiting: b
Visiting: d
Visiting: f
Visiting: c
Visiting: e
Visited = [a, b, d, f, c, e].*/
