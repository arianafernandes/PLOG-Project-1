%Includes
:-include('utils.pl'). %Utils

%LIBRARIES
:- use_module(library(lists)). %lists
:- use_module(library(random)). %random

:-dynamic lockedPieces/2.
lockedPieces(1,0).
lockedPieces(2,0).

gameState(board,lockedPieces,turnToPlay).

%Game Initializer 
gameInit:-
        retract(lockedPieces(1, _)),
        assert(lockedPieces(1, 0)),
        retract(lockedPieces(2, _)),
        assert(lockedPieces(2, 0)),
        board(T),
        write('Placing Player1 Pieces\n'),   
        positionPlayerPieces(1,T,NewBoard),
        write('Placing Player2 Pieces\n'), 
        positionPlayerPieces(2,NewBoard,NewBoard2),
        write('Displaying Initial Board\n'),
        display_tab(NewBoard2),
        game_loop(1,NewBoard2).


%Game loops

game_loop(1, Board):-  % Play 1 turn
        write('Player1 turn !\n'),
        choosePieceToMove(1,Board,NewBoard),
        display_tab(NewBoard),
        lockedPieces(2, CheckWin),
        write(CheckWin),
        write('piece(s) locked from Player 2\n'),
        ((CheckWin == 9)->write('Player1 wins');game_loop(2,NewBoard)).
game_loop(2, Board):-  % Play 2 turn
        write('Player2 turn !\n'),
        choosePieceToMove(2,Board,NewBoard),
        display_tab(NewBoard),
        lockedPieces(1, CheckWin),
        write(CheckWin),
        write('piece(s) locked from Player 1\n'),
        ((CheckWin == 9)->write('Player1 wins');game_loop(1,NewBoard)).

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

%Locks Piece
lockPiece(Player):-
        lockedPieces(Player, CurrentPieces),
        NewPieces is CurrentPieces + 1,
        retract(lockedPieces(Player, _)),
        assert(lockedPieces(Player, NewPieces)).

%Unclock Piece
unlockPiece(1):-
        lockedPieces(1, CurrentPieces),
        NewPieces is CurrentPieces - 1,
        retract(lockedPieces(1, _)),
        assert(lockedPieces(1, NewPieces)).
unlockPiece(2):-
        lockedPieces(2, CurrentPieces),
        NewPieces is CurrentPieces - 1,
        retract(lockedPieces(2, _)),
        assert(lockedPieces(2, NewPieces)).
unlockPiece(C):-
        ((last(C,s1))->unlockPiece(1));true,
        ((last(C,m1))->unlockPiece(1));true,
        ((last(C,l1))->unlockPiece(1));true,
        ((last(C,s2))->unlockPiece(2));true,
        ((last(C,m2))->unlockPiece(2));true,
        ((last(C,l2))->unlockPiece(2));true.
      
%Checks if the player can move certain Piece from (Row, Col) to (RowDest,ColDest) in the Board
checkIsValidMove(Row, Col,RowDest,ColDest, 1, Board):-
        getCell(Row,Col,Board,C),
        write(C),nl,
        write([C]),nl,
        getCell(RowDest,ColDest,Board,D),
        write(D),nl,
        write([D]),nl,
        
         ((last(D,x))->fail;true),
         ((last(D,center))->fail;true),
         ((last(C,x))->fail;true),
         ((last(C,s1))->( ((areAdjacent(Row,Col,RowDest,ColDest,3))->true;fail),
                          ((last(D,x))->fail;true),
                          ((last(D,s2))->lockPiece(2);true),
                          ((last(D,m2))->fail;true),
                          ((last(D,l2))->fail;true),
                          ((last(D,s1))->lockPiece(1);true),
                          ((last(D,m1))->fail;true),
                          ((last(D,l1))->fail;true));true),
         ((last(C,m1))->( ((areAdjacent(Row,Col,RowDest,ColDest,2))->true;fail),
                          ((last(D,x))->fail;true),
                          ((last(D,s2))->lockPiece(2);true),
                          ((last(D,m2))->lockPiece(2);true),
                          ((last(D,l2))->fail;true),
                          ((last(D,s1))->lockPiece(1);true),
                          ((last(D,m1))->lockPiece(1);true),
                          ((last(D,l1))->fail;true));true),
         ((last(C,l1))->( ((areAdjacent(Row,Col,RowDest,ColDest,1))->true;fail),
                          ((last(D,x))->fail;true),
                          ((last(D,s2))->lockPiece(2);true),
                          ((last(D,m2))->lockPiece(2);true),
                          ((last(D,l2))->lockPiece(2);true),
                          ((last(D,s1))->lockPiece(1);true),
                          ((last(D,m1))->lockPiece(1);true),
                          ((last(D,l1))->lockPiece(1);true));true),
         ((last(C,s2))->fail;true),
         ((last(C,m2))->fail;true),
         ((last(C,l2))->fail;true).

checkIsValidMove(Row, Col,RowDest,ColDest, 2, Board):-
        getCell(Row,Col,Board,C),
        write(C),nl,
        write([C]),nl,
        getCell(RowDest,ColDest,Board,D),
        write(D),nl,
        write([D]),nl,
        
        ((last(D,center))->fail;true),
         ((last(C,x))->fail;true),
         ((last(C,s2))->( ((areAdjacent(Row,Col,RowDest,ColDest,3))->true;fail),
                          ((last(D,x))->fail;true),
                          ((last(D,s1))->lockPiece(1);true),
                          ((last(D,m1))->fail;true),
                          ((last(D,l1))->fail;true),
                          ((last(D,s2))->lockPiece(2);true),
                          ((last(D,m2))->fail;true),
                          ((last(D,l2))->fail;true));true),
         ((last(C,m2))->( ((areAdjacent(Row,Col,RowDest,ColDest,2))->true;fail),
                          ((last(D,x))->fail;true),
                          ((last(D,s1))->lockPiece(1);true),
                          ((last(D,m1))->lockPiece(1);true),
                          ((last(D,l1))->fail;true),
                          ((last(D,s2))->lockPiece(2);true),
                          ((last(D,m2))->lockPiece(2);true),
                          ((last(D,l2))->fail;true));true),
         ((last(C,l2))->( ((areAdjacent(Row,Col,RowDest,ColDest,1))->true;fail),
                          ((last(D,x))->fail;true),
                          ((last(D,s1))->lockPiece(1);true),
                          ((last(D,m1))->lockPiece(1);true),
                          ((last(D,l1))->lockPiece(1);true),
                          ((last(D,s2))->lockPiece(2);true),
                          ((last(D,m2))->lockPiece(2);true),
                          ((last(D,l2))->lockPiece(2);true));true),
         ((last(C,s1))->fail;true),
         ((last(C,m1))->fail;true),
         ((last(C,l1))->fail;true).

movePiece(Row,Col,RowDest,ColDest,Board,NewBoard):-
        getCell(Row,Col,Board,C),
        lastElem(C,Las),
        % write(Las),
        emptyCell(Row,Col,Board,NewBoard1),
        
        getCell(Row,Col,NewBoard1,C2),
        write(C2),nl,
        unlockPiece(C2),
        %getCell(RowDest,ColDest,NewBoard1,D),
        %append(D,Las,NewCell),
        setCell(RowDest,ColDest,NewBoard1,[Las],NewBoard).

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