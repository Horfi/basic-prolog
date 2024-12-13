% Assignment2Task1a.pl

% Facts edges between vertices in a directed G
edge(d, a).
edge(c, a).
edge(a, b).
edge(b, e).
edge(f, e).
edge(g, f).
edge(i, h).

% directeed path from Start to End of length 1
directedpath(Start, End) :-
    edge(Start, End).

% for longer paths 
directedpath(Start, End) :-
    edge(Start, Temp),
    directedpath(Temp, End).

% directed path from Start to End with a specific Length
directedpathwithlength(Start, End, 1) :-
    edge(Start, End).

% for handling longer paths with specified length as input
directedpathwithlength(Start, End, N) :-
    edge(Start, Temp),
    directedpathwithlength(Temp, End, SubLength),
    N is SubLength + 1.