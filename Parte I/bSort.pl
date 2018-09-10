
getLessWithTail([],[],[]).
getLessWithTail([X],X,[]).
getLessWithTail([Head,Neck|Tail],Less, Body)
  :-
    ( Head > Neck -> 
    ( Body = [Head|Rest],
     getLessWithTail([Neck|Tail], Less, Rest) );
    ( Body = [Neck|Rest],
     getLessWithTail([Head|Tail], Less, Rest) ) ).







bSort([],[]).
bSort([A], [A]).
bSort(List, Z) :-
    Z = [K|J],
    getLessWithTail(List, K, L),
    bSort(L, J).
