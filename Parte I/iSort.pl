iSort([X|Xs], Ord)
 :- iSort(Xs, Z),
    insertion(X, Z, Ord).
iSort([], []).
iSort([X], X).


insertion(Pivot, [], [Pivot]).
insertion(Pivot, [X|Xs], [X|Z]) :-
 (   Pivot > X -> insertion(Pivot, Xs, Z) ).

insertion(Pivot, [X|Xs], [Pivot,X|Xs]).
