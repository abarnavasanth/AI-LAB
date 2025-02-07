% Edge definitions: Define your graph edges here
edge(a, b).
edge(a, c).
edge(b, d).
edge(c, d).
edge(c, e).
edge(d, f).
edge(e, f).

% BFS algorithm
shortest_path(Start, Goal, Path) :-
    bfs_search([[Start]], Goal, Path).

bfs_search([[Goal|Rest]|_], Goal, Path) :-
    reverse([Goal|Rest], Path).

bfs_search([CurrentPath|OtherPaths], Goal, Path) :-
    CurrentPath = [CurrentNode|_],
    findall([NextNode|CurrentPath],
        (edge(CurrentNode, NextNode), \+ member(NextNode, CurrentPath)),
        NewPaths),
    append(OtherPaths, NewPaths, UpdatedPaths),
    bfs_search(UpdatedPaths, Goal, Path).

% Example query
% ?- bfs(a, f, Path).
