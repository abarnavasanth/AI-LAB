% Performance: Criteria for success
performance(vacuum, [clean_area, minimize_energy, minimize_time]).

% Environment: Dirt, room layout
environment(vacuum, [room_layout, dirt_locations, obstacles]).

% Actuators: Actions the vacuum cleaner can perform
actuators(vacuum, [move_forward, turn_left, turn_right, suck, stop]).

% Sensors: Inputs to the agent
sensors(vacuum, [dirt_sensor, obstacle_sensor, battery_level]).

% Example rules for vacuum agent behavior
detect_dirt(true, suck).
detect_dirt(false, move_forward).

detect_obstacle(true, turn_left).
detect_obstacle(false, move_forward).
%Queries
%?- performance(vacuum, Goals).
%Output: Goals = [clean_area, minimize_energy, minimize_time].
%?- actuators(vacuum, Actions).
%Output: Actions = [move_forward, turn_left, turn_right, vacuum, stop].
%?- detect_dirt(true, Action).
%Output: Action = suck.
%?- detect_obstacle(true, Action).
%Output: Action = turn_left.

