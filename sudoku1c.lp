% Question 1c - 4x4 Sudoku with subgrids
% Only show sudoku/3.

row(1..4).
col(1..4).
num(1..4).

n(2).  % subgrid size for 4x4 is 2x2

% subgrid id:
% G = 1 + ((X-1)/n)*n + ((Y-1)/n)
subgrid(X,Y,G) :-
    row(X), col(Y),
    n(N),
    G = 1 + ((X-1)/N)*N + ((Y-1)/N).

% Exactly one number per cell
1 { sudoku(X,Y,N) : num(N) } 1 :- row(X), col(Y).

% Respect initial clues
sudoku(X,Y,N) :- initial(X,Y,N).
:- initial(X,Y,N), sudoku(X,Y,M), M != N.

% Row: no duplicates
:- row(X), num(N), 2 { sudoku(X,Y,N) : col(Y) }.

% Column: no duplicates
:- col(Y), num(N), 2 { sudoku(X,Y,N) : row(X) }.

% Subgrid: no duplicates
:- subgrid(X,Y,G), num(N),
   2 { sudoku(X1,Y1,N) : subgrid(X1,Y1,G) }.

#show sudoku/3.
