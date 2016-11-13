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
%3d
setBoard3dElem(CoordX-CoordY-CoordZ,Value,IndX,IndY,IndZ,[H|T],[H|NewBoard]):-
       ((IndX < 5)-> (setBoard2dElem(CoordX-CoordY-CoordZ,Value,IndX,0,0,T,NewBoard),
                      NextIndX is IndX+1,
                      setBoard3dElem(CoordX-CoordY-CoordZ,Value,NextIndX,IndY,IndZ,T,NewBoard));true).
                        
setBoard2dElem(CoordX-CoordY-CoordZ,Value,IndX,IndY,IndZ,[H|T],[H|NewBoard]):-
        ((IndY < 5)->(
                      setBoardElem(CoordX-CoordY-CoordZ,Value,IndX,IndY,0,T,NewBoard),
                      NextIndY is IndY+1,
                      setBoard2dElem(CoordX-CoordY-CoordZ,Value,IndX,NextIndY,IndZ,T,NewBoard));true).
setBoardElem(CoordX-CoordY-CoordZ,Value,IndX,IndY,IndZ,[C|T],[H|NewBoard]):-
        ((IndZ <1)->( 
                       ((equalPosition(CoordX-CoordY-CoordZ,IndX-IndY-IndZ))-> ([Value|NewBoard]);
                                                                               ([C|NewBoard])
                       ),
                       NextIndZ is IndZ+1,
                       setBoardElem(CoordX-CoordY-CoordZ,Value,IndX,IndY,NextIndZ,T,NewBoard)
                      );true).
     
        
equalPosition(X-Y-Z,X1-Y1-Z1):-
        ((X == X1)->((Y == Y1)->((Z == Z1)->true))).        
        
/* Canas
setBoard3dElem
%Changes value of (X,Y,Z) in the board
%3d
setBoard3dElem(0-CoordY-CoordZ,Value,[H|T],[NewH|T]):-
        setBoard2dElem(CoordY-CoordZ,Value,H,NewH).
setBoard3dElem(CoordX-CoordY-CoordZ,Value,[H|T],[H|NewBoard]):-
        CoordX > 0,
        CoordX1 is CoordX -1,
        setBoard3dElem(CoordX1-CoordY-CoordZ,Value,T,NewBoard).
%2d
setBoard2dElem(0-CoordZ,Value,[H,T],[NewH|T]):-
        setBoardElem(CoordZ,Value,H,NewH).
setBoard2dElem(CoordY-CoordZ,Value,[H|T],[H|NewBoard]):-
        CoordY >0,
        CoordY1 is CoordY -1,
        setBoard2dElem(CoordY1-CoordZ,Value,T,NewBoard).
%1d,
setBoardElem(0,Value,[_|T],[NewValue|T]).
setBoardElem(CoordZ,Value,[H|T],[H|NewBoard]):-
        CoordZ > 0,
        CoordZ1 is CoordZ -1,
        setBoardElem(CoordZ1,Value,T,NewBoard).
*/              
        


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
        display_board(T),
        setBoard3dElem(0-0-0,o,0,0,0,T,newT).
        
        
             
       
 