main(Vars) :-
    Vars = [A,B,C,D,E],
    Vars ins 1..4,
    B #\= 3,
    C #\= 2,
    A #\= B,
    B #\= C,
    C #< D,
    A #= D,
    E #< A,
    E #< B,
    E #< C,
    E #< D,
    B #\= D,
    label(Vars).


    
color(Vars) :-
    Vars = [WA,NT,Q,NSW,V,SA,T],
    Vars ins 0..2,
    WA #\= NT,
    WA #\= SA,
    Q #\= NT,
    Q #\= SA,
    Q #\= NSW,
    SA #\= NT,
    SA #\= NSW,
    SA #\= V,
    NSW #\= V.

%    label(Vars).

	