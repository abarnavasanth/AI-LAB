% Define the graph with edges and costs
edge(a, b, 4).
edge(a, c, 2).
edge(b, d, 5).
edge(c, d, 8).
edge(c, e, 10).
edge(d, f, 3).
edge(e, f, 4).
edge(d, e, 2).

% Define heuristic values (Estimated cost from node to goal)
heuristic(a, 7).
heuristic(b, 6).
heuristic(c, 4).
heuristic(d, 2).
heuristic(e, 3).
heuristic(f, 0). % Goal node has heuristic 0

% A* Algorithm
astar(Start, Goal, Path, Cost) :-
    astar_helper([[Start, 0, 0, [Start]]], Goal, Path, Cost).

astar_helper([[Goal, _, Cost, Path] | _], Goal, Path, Cost).

astar_helper([[Node, G, _, P] | Rest], Goal, Path, Cost) :-
    findall([Next, GNew, FNew, [Next | P]],
        (edge(Node, Next, C), GNew is G + C, heuristic(Next, H), FNew is GNew + H),
        Children),
    append(Rest, Children, NewOpen),
    sort(2, @=<, NewOpen, SortedOpen),
    astar_helper(SortedOpen, Goal, Path, Cost).

% Memory Bounded A* (Simplified Version)
mba_star(Start, Goal, Path, Cost, MemoryLimit) :-
    mba_helper([[Start, 0, 0, [Start]]], Goal, Path, Cost, MemoryLimit).

mba_helper([[Goal, _, Cost, Path] | _], Goal, Path, Cost, _).

mba_helper(Open, Goal, Path, Cost, MemoryLimit) :-
    length(Open, Len),
    (Len > MemoryLimit -> trim(Open, TrimmedOpen) ; TrimmedOpen = Open),
    astar_helper(TrimmedOpen, Goal, Path, Cost).

% Trimming function to limit memory usage
trim(Open, TrimmedOpen) :-
    length(Open, Len),
    TrimSize is max(1, Len // 2),
    length(TrimmedOpen, TrimSize),
    append(TrimmedOpen, _, Open).
% Queries to test the algorithms
% Find the shortest path using A*
% ?- astar(a, f, Path, Cost).

% Find the shortest path using Memory Bounded A* with a memory limit of 3
% ?- mba_star(a, f, Path, Cost, 3).
