% Performance: Criteria for success
performance(taxi, [maximize_profit, minimize_time, ensure_safety, optimize_fuel]).

% Environment: Road, traffic, passengers
environment(taxi, [road_conditions, traffic_signals, passengers, destinations, obstacles]).

% Actuators: Actions the taxi can perform
actuators(taxi, [accelerate, brake, turn_left, turn_right, pick_up_passenger, drop_off_passenger]).

% Sensors: Inputs to the agent
sensors(taxi, [gps, camera, lidar, speedometer, passenger_request]).

% Example rules for taxi agent behavior
respond_to_signal(green, accelerate).
respond_to_signal(yellow, brake).
respond_to_signal(red, brake).

handle_request(passenger_request(Location, Destination), pick_up_passenger(Location, Destination)) :-
    write("Picking up passenger from "), write(Location), nl.

deliver_passenger(Destination, drop_off_passenger(Destination)) :-
    write("Dropping off passenger at "), write(Destination), nl.
% Queries
%?- performance(taxi, Goals).
% Output: Goals = [maximize_profit, minimize_time, ensure_safety, optimize_fuel].
%?- actuators(taxi, Actions).
% Output: Actions = [accelerate, brake, turn_left, turn_right, pick_up_passenger, drop_off_passenger].
%?- handle_request(passenger_request('Station', 'Mall'), Action).
/*Output: Picking up passenger from Station
Action = pick_up_passenger('Station', 'Mall').*/
%?- respond_to_signal(green, Action).
% Output: Action = accelerate.
% ?- deliver_passenger('Mall', drop_off_passenger('Mall')).
% Output: Dropping off passenger at Mall
