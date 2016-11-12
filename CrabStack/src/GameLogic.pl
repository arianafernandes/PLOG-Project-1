%Includes
:-include('CrabStackExemple.pl'). %temp

%LIBRARIES
:- use_module(library(lists)). %lists
:- use_module(library(random)). %random

%List representing the Tab
board([
         [[zero],[empty],[empty],[empty],[zero]],
         [[zero],[empty],[empty],[empty],[empty]],
         [[empty],[empty],[center],[empty],[empty]],
         [[zero],[empty],[empty],[empty],[empty]],
         [[zero],[empty],[empty],[empty],[zero]]
          ]).

%Game Initializer 
gameInit:-board(T),
        write('Placing Player1 Pieces\n'),   
        positionPlayerPieces(1,T).
        %positionPlayerPieces(2,T).

%Place Player Pieces int the board
positionPlayerPieces(N,T):-
        write('Placing Player1 SmallPieces\n'),
        positionSmallPiecies(N,T).
        %positionMediumPiecies(N,T),
        %positionLargePiecies(N,T).

%Place Small Player Piecies 
positionSmallPiecies(N,T):-
        write('Placing Player1 SmallPiece\n'),
        placeSmallPiece(N,T,0).
        %placeSmallPiece(N,T,0),
        %placeSmallPiece(N,T,0).

placeSmallPiece(N,T,Placed):-
         Placed == 0,
         write('Vou gerar um posição\n'),
         generateRandomNumber(X,Y),
         write('Gerei um posição\n'),
         write(X),
         write(Y),
         nth0(X, T, Row),
         write('Encontrei uma Row\n'),
         nth0(Y, Row, Elem),
         write('Encontrei um Elemento\n'),
         %nth0(0, Elem, Elem0),
         %translate(Elem0,E),
         % E \= 'x',
         nth0(0, Elem, s1),
         write('Mudei o Elemento\n'),
         placeSmallPiece(N,T,1).

placeSmallPiece(N,T,Placed):-
         Placed == 1.      

%Generates a random Coord(X,Y) [0,4]
generateRandomNumber(X,Y):-
        random(0,4,X),
        random(0,4,Y).

%Changes value of (X,Y,Z) in the board
setBoard3dElem(0-CoordY-CoordZ,Value,[H|T],[NewH,T]):-
        setBoard2dElem(CoordY-CoordZ,Value,H,NewH).
setBoard3dElem(CoordX-CoordY-CoordZ,Value,[H|T],[H,NewBoard]):-
        CoordX > 0,
        CoordX is CoordX -1,
        setBoard3dElem(CoordX-CoordY-CoordZ,Value,T,NewBoard).

setBoard2dElem(CoordY-CoordZ,Value,[H|T],[H,NewBoard]):-
        CoordY >0,
        CoordY is CoordY -1,
        setBoard2dElem(CoordY-CoordZ,Value,T).
        
        


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
displayB:- 
        board(T),
        display_board(T).
        
             
       
 