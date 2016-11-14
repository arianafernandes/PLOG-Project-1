%Includes
:-include('utils.pl'). %Utils

%LIBRARIES
:- use_module(library(lists)). %lists
:- use_module(library(random)). %random

:-dynamic lockedPieces/2.
lockedPieces(1,0).
lockedPieces(2,0).
turnToPlay(1).
gameState(board,lockedPieces,turnToPlay).

%Game Initializer 
gameInit:-board(T),
        %write('Placing Player1 Pieces\n'),   
        positionPlayerPieces(1,T,NewBoard),
        % NewT is T,
        positionPlayerPieces(2,NewBoard,NewBoard2),
        display_tab(NewBoard2).
        %game_loop(1,NewBoard2).


%Game loops

game_loop(1, Board):-  % Play 1 turn
        write('Player1 turn !\n'),
        choosePieceToMove(1,Board,NewBoard).

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
        
%Checks if the player can move certain Piece from (Row, Col) to (RowDest,ColDest) in the Board
checkIsValidMove(Row, Col,RowDest,ColDest, 1, Board):-
        getCell(Row,Col,Board,[C]),
        getCell(RowDest,ColDest,Board,[D]),
         ((last(C,s1))->( ((areAdjacent(Row,Col,RowDest,ColDest,3))->true;false),
                          ((last(D,s2))->true;true),
                          ((last(D,m2))->false;true),
                          ((last(D,l2))->false;true),
                          ((last(D,s1))->true;true),
                          ((last(D,m1))->false;true),
                          ((last(D,l1))->false;true));true),
         ((last(C,m1))->( ((areAdjacent(Row,Col,RowDest,ColDest,2))->true;false),
                          ((last(D,s2))->true;true),
                          ((last(D,m2))->true;true),
                          ((last(D,l2))->false;true),
                          ((last(D,s1))->true;true),
                          ((last(D,m1))->true;true),
                          ((last(D,l1))->false;true));true),
         ((last(C,l1))->( ((areAdjacent(Row,Col,RowDest,ColDest,1))->true;false),
                          ((last(D,s2))->true;true),
                          ((last(D,m2))->true;true),
                          ((last(D,l2))->true;true),
                          ((last(D,s1))->true;true),
                          ((last(D,m1))->true;true),
                          ((last(D,l1))->true;true));true),
         ((last(C,s2))->false;true),
         ((last(C,m2))->false;true),
         ((last(C,l2))->false;true).

movePiece(Row,Col,RowDest,ColDest,Player,Board,NewBoard):-
        getCell(Row,Col,Board,C),
        lastElem(C,Las),
        write(Las),
        emptyCell(Row,Col,Board,NewBoard1),
        getCell(RowDest,ColDest,NewBoard1,D),
        append(D,Las,NewCell),
        setCell(RowDest,ColDest,NewBoard1,NewCell,NewBoard).

%Temporary funtions
/*
printPosition(X,Y):-
        board(T),
        nth0(X, T, Row),
        nth0(Y, Row, Elem),
        nth0(0, Elem, Elem0),
        translate(Elem0,C),
        write(C).
*/   