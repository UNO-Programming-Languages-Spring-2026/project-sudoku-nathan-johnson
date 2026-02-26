% Sudoku Solver - Question 1b (4x4)
% Keep the 4x4 row/column filling from 1a and ALSO output subgrid/3.

row(1..4).
col(1..4).
num(1..4).

% subgrid size for 4x4 is 2x2
n(2).

% Map each cell (X,Y) to a subgrid label G in 1..4
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

#show sudoku/3.
#show subgrid/3.
