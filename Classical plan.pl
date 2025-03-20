% Initial state
state([at(package, depot), at(truck, depot)]).

% Goal state
goal([at(package, warehouse)]).

% Action: move package
action(move(package, depot, warehouse),
       [at(package, depot), at(truck, depot)],    % Preconditions
       [at(package, depot)],                     % Delete List
       [at(package, warehouse)]).                % Add List

% Plan solving
solve_plan(State, Plan) :-
    goal(Goal),
    subset(Goal, State),                         % Goal reached
    Plan = [].
solve_plan(State, [Action|Actions]) :-
    action(Action, Pre, Del, Add),
    subset(Pre, State),                          % Check preconditions
    subtract(State, Del, TempState),             % Apply delete effects
    union(TempState, Add, NewState),             % Apply add effects
    solve_plan(NewState, Actions).

% Query example
?- state(Initial), solve_plan(Initial, Plan).
