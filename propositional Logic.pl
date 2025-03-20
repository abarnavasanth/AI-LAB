% Facts
rainy(weather).
cold(weather).

% Rules
wear_jacket :- rainy(weather).
wear_jacket :- cold(weather).
carry_umbrella :- rainy(weather).
stay_home :- rainy(weather), cold(weather).

% Query
inference(Decision) :- (wear_jacket, Decision = 'Wear a jacket');
                       (carry_umbrella, Decision = 'Carry an umbrella');
                       (stay_home, Decision = 'Stay home').
% ?- inference(Decision).
% Output:
%Decision = 'Wear a jacket' ;
%Decision = 'Carry an umbrella' ;
%Decision = 'Stay home'.
