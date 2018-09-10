push([], Ys, Ys).
push([X|Xs], Ys, [X|Z]) :- push(Xs, Ys, Z).

right([], Pivot, []).
right([X|Xs], Pivot, R)
 :- X >= Pivot, right(Xs, Pivot, Rs), push(Rs, [X], R).
right([X|Xs], Pivot, R)
 :- right(Xs, Pivot, R).


left([], Pivot, []).
left([X|Xs], Pivot, L)
 :- X < Pivot, left(Xs, Pivot, Ls), push(Ls, [X], L).
left([X|Xs], Pivot, L)
 :- left(Xs, Pivot, L).





qSort([Head|Tail], Ord)
 :-
    right(Tail, Head, Right),
    left(Tail, Head, Left),
    qSort(Left, L),
    qSort(Right, R),
    push(L,[Head|R], Ord).
qSort([],[]).
