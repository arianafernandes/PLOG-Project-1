%Includes
:-include('utils.pl'). %Utils

%LIBRARIES
:- use_module(library(lists)). %lists
:- use_module(library(random)). %random

%Game Initializer 
gameInit:-board(T),
        %write('Placing Player1 Pieces\n'),   
        positionPlayerPieces(1,T,NewBoard),
        % NewT is T,
        positionPlayerPieces(2,NewBoard,NewBoard2),
        display_tab(NewBoard2).

%Place Player Pieces int the board
positionPlayerPieces(N,T,NewBoard):-
        %write('Placing Player1 SmallPieces\n'),
        positionSmallPiecies(N,T,New1),
        positionMediumPiecies(N,New1,New2),
        positionLargePiecies(N,New2,NewBoard).

%Place Small Player Piecies 

positionSmallPiecies(N,T,NewBoard):-
        %write('Placing Player SmallPiece\n'),
        ( (N == 1)->(placePiece(N,T,NewBoard1,0,s1),
        placePiece(N,NewBoard1,NewBoard2,0,s1),
        placePiece(N,NewBoard2,NewBoard,0,s1));
        (placePiece(N,T,NewBoard1,0,s2),
        placePiece(N,NewBoard1,NewBoard2,0,s2),
        placePiece(N,NewBoard2,NewBoard,0,s2))).

positionMediumPiecies(N,T,NewBoard):-
        %write('Placing Player SmallPiece\n'),
        ( (N == 1)->(placePiece(N,T,NewBoard1,0,m1),
        placePiece(N,NewBoard1,NewBoard2,0,m1),
        placePiece(N,NewBoard2,NewBoard,0,m1));
        (placePiece(N,T,NewBoard1,0,m2),
        placePiece(N,NewBoard1,NewBoard2,0,m2),
        placePiece(N,NewBoard2,NewBoard,0,m2))).

positionLargePiecies(N,T,NewBoard):-
        %write('Placing Player SmallPiece\n'),
        ( (N == 1)->(placePiece(N,T,NewBoard1,0,l1),
        placePiece(N,NewBoard1,NewBoard2,0,l1),
        placePiece(N,NewBoard2,NewBoard,0,l1));
        (placePiece(N,T,NewBoard1,0,l2),
        placePiece(N,NewBoard1,NewBoard2,0,l2),
        placePiece(N,NewBoard2,NewBoard,0,l2))).

placePiece(N,T,NewBoard,Placed,Char):-
         Placed == 0,
         %write('Vou gerar um posição\n'),
         generateRandomNumber(X,Y),
         %write('Gerei um posição\n'),
         %write(X),
         %write(Y),
         getCell(X,Y,T,[C]),
         %write(C),
         ((C == empty)->(
                %write('\nEncontrei uma celula vazia\n'),                           
                emptyCell(X,Y,T,NewT),
                %write('Limpei a casa\n'),
                setCell(X,Y,NewT,[Char],NewBoard),
                %write('Dei set\n'), 
                %getCell(X,Y,NewBoard,[B]),
                %write(B),
                placePiece(N,T,NewBoard,1,Char)); (placePiece(N,T,NewBoard,Placed,Char))).
         

placePiece(N,T,NewBoard,Placed,Char):-
         Placed == 1.      

%Generates a random Coord(X,Y) [1,5]
generateRandomNumber(X,Y):-
        random(1,6,X),
        random(1,6,Y).


equalPosition(X,Y,Z,X1,Y1,Z1):-
        ((X == X1)->((Y == Y1)->((Z == Z1)->true))).        
        


%Temporary funtions
/*
printPosition(X,Y):-
        board(T),
        nth0(X, T, Row),
        nth0(Y, Row, Elem),
        nth0(0, Elem, Elem0),
        translate(Elem0,C),
        write(C).

displayB:- 
        board(T),
        display_board(T),*/     