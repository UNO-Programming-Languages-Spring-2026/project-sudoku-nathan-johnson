% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

row(1..4).
col(1..4).
num(1..4).

% Exactly one number per cell
1 { sudoku(X,Y,N) : num(N) } 1 :- row(X), col(Y).

% Respect initial clues
sudoku(X,Y,N) :- initial(X,Y,N).
:- initial(X,Y,N), sudoku(X,Y,M), M != N.

% Row constraint: no duplicates
:- row(X), num(N), 2 { sudoku(X,Y,N) : col(Y) }.

% Column constraint: no duplicates
:- col(Y), num(N), 2 { sudoku(X,Y,N) : row(X) }.

#show sudoku/3.
