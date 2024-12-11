%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This file contains the definition of some useful list operations. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% 1. Adding an object to a list
% add(X, L, R) holds if R is L with X added at the front.
add(X, L, [X | L]).

%%% 2. Deleting an object from a list
% del(X, L, R) holds if R is L with one occurrence of X removed.

% BASE CASE: Removing X when it is the head.
del(X, [X | Tail], Tail).

% RECURSIVE CASE: If X is not at the head, keep the head and recurse on the tail.
del(X, [Y | Tail], [Y | Tail1]) :-
    del(X, Tail, Tail1).

%%% 3. Checking for membership
% ismember(X, L) holds if X is an element of L.

% BASE CASE: X is the head of the list.
ismember(X, [X | _]).

% RECURSIVE CASE: If not at the head, check the tail.
ismember(X, [_ | Tail]) :-
    ismember(X, Tail).

%%% 4. Concatenation of two lists
% conc(L1, L2, L3) holds if L3 is the concatenation of L1 and L2.

% BASE CASE:
conc([], L, L).

% RECURSIVE CASE:
conc([X | L1], L2, [X | L3]) :-
    conc(L1, L2, L3).

%%% 5. Determining a sublist
% issublist(S, L) holds if S is a sublist of L.

issublist(S, L) :-
    conc(_, L2, L),
    conc(S, _, L2).

%%% 6. Checking if two lists have equal length without computing length
% equal_length(L1, L2) holds if L1 and L2 have the same number of elements.

equal_length([], []).
equal_length([_ | T1], [_ | T2]) :-
    equal_length(T1, T2).

%%% 7. Finding a common member in two lists
% common_member(X, L1, L2) holds if X is a member of both L1 and L2.

common_member(X, L1, L2) :-
    ismember(X, L1),
    ismember(X, L2).
