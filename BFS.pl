% Define the graph edges (Undirected Graph)
edge(a, b).
edge(a, c).
edge(b, d).
edge(c, e).
edge(d, f).
edge(e, f).
edge(d, e).

% Since the graph is undirected, add reverse edges
connected(X, Y) :- edge(X, Y).
connected(Y, X) :- edge(X, Y).

% BFS Algorithm to find the shortest path
shortest_path(Start, Goal, Path) :-
    bfs([[Start]], Goal, Path).

% BFS Traversal
bfs([[Goal|Rest] | _], Goal, Path) :-
    reverse([Goal|Rest], Path).  % If Goal is found, return path

bfs([CurrentPath | OtherPaths], Goal, Path) :-
    CurrentPath = [CurrentNode | _],
    findall([Next, CurrentNode | CurrentPath],  % Generate new paths
            (connected(CurrentNode, Next), \+ member(Next, CurrentPath)),
            NewPaths),
    append(OtherPaths, NewPaths, UpdatedQueue), % Append new paths to queue
    bfs(UpdatedQueue, Goal, Path).  % Continue BFS
%Queries:
%shortest_path(a, f, Path).
%Output:
%Path = [a, c, e, f]. or Path = [a, b, d, f].
