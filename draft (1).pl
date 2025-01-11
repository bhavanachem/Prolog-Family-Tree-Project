father(tony, abe).
father(tony, sarah).
father(abe, john).
father(bill, susan).
father(john, jill).
father(rob, jack).
father(rob, phil).
father(jack, jim).
 
mother(lisa, abe).
mother(lisa, sarah).
mother(nancy, john).
mother(sarah, susan).
mother(mary, jill).
mother(susan, jack).
mother(susan, phil).
 
parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).
gp(X,Y) :- parent(X,Z), parent(Z,Y).
ggp(X,Y) :- parent(X,Z), gp(Z,Y).
gggp(X,Y) :- parent(X,Z), ggp(Z,Y).
 
anc(X,Y) :- parent(X,Y).
anc(X,Y) :- parent(X,Z), anc(Z,Y).
 
mem(X,[X|_]).
mem(X,[_|T]) :- mem(X,T).
 
lst(X, [X]).
lst(X, [_|T]) :- lst(X, T).
 
app([], L, L).
app([H|T], L, [H | R]) :- app(T, L, R).
 
sel(X, [X|T], T).
sel(X, [Y|T], [Y|R]) :- sel(X, T, R).
 
hanoi(1, A, B, _, [(A,B)]).
hanoi(N, A, B, C,  M  ) :- N > 1, N1 is N - 1,
             hanoi(N1, A, C, B, M1),
             hanoi(N1, C, B, A, M2),
             app(M1, [(A,B)| M2], M).
 
solve([S,E,N,D,M,O,R,Y]) :- M = 1, sel(D, [0,2,3,4,5,6,7,8,9], R1),
          sel(E, R1, R2), Y is (D + E) mod 10, C1 is (D+E) // 10,
          sel(Y, R2, R3), sel(N, R3, R4), sel(R, R4, R5),
          E is (N + R + C1) mod 10, C2 is (N+R+C1)//10,
          sel(O,R5,R6), N is (E+O+C2) mod 10, C3 is (E+O+C2)//10,
          sel(S,R6,_), O is (S+M+C3) mod 10, M is (S+M+C3)//10.
         
 
fac(0, 1).
fac(N, M) :- N > 0, N1 is N-1, fac(N1, M1), M is N*M1.
 
 
 
% Gender information.
 
male(tony).
male(abe).
male(bill).
male(john).
male(rob).
male(jack).
male(phil).
male(rick).
male(jim).
 
female(lisa).
female(nancy).
female(sarah).
female(mary).
female(susan).
female(jill).
female(ann).
female(kim).
female(martha).
