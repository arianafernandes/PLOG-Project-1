%:-dynamic game/4.
:-include('GameLogic.pl').

crabPvP:-
        gameInit.

choosePieceToMove(Player, Board, NewBoard):-
    write('\n Please introduce the row and collumn of the piece you want to move:'),
    write('\n    Piece Row(X) '), read(Row), Row > 0, Row =< 5,
    write('\n    Piece Collumn(Y)  '), read(Col), Col > 0, Col =< 5,
    write('\n Please introduce the row and collumn where you want to move your piece'),
    write('\n    Piece Row '), read(RowDest), Row > 0, Row =< 5,
    write('\n    Piece Collumn  '), read(ColDest), Col > 0, Col =< 5,
    (checkIsValidMove(Row, Col,RowDest,ColDest, Player, Board) ->
                    movePiece(Row,Col,RowDest,ColDest,Player,Board,NewBoard);
                    displayMessage(['\nYou have to choose an available Play!']),
                    choosePieceToMove(Player, Board, NewBoard))                                   
                ;
        displayMessage(['\n Canst move that piece! Please choose one of your pieces! ']),
        choosePieceToMove(Player, Board, NewBoard).
