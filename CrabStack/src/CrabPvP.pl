%:-dynamic game/4.
:-include('GameLogic.pl').

crabPvP:-
        %retractall(gameState),
        gameInit.

choosePieceToMove(Player, Board, NewBoard):-
    write('\n Please introduce the row and collumn of the piece you want to move'),
    write('\n    Piece Row '), read(Row), Row > 0, Row =< 5,
    write('\n    Piece Collumn  '), read(Col), Col > 0, Col =< 5,
    write('\n Please introduce the row and collumn where you want to move your piece'),
    write('\n    Piece Row '), read(Row), Row > 0, Row =< 5,
    write('\n    Piece Collumn  '), read(Col), Col > 0, Col =< 5,
    (checkIsValidMove(Piece,Row, Col,RowDest,ColDest, Player, Board) ->
                    MovePiece(Piece,Row,Col,RowDest,ColDest,Player,Board,NewBoard);
                    displayMessage(['\nYou have to choose an available Play!']),
                    choosePieceToMove(Player, Board, NewBoard))                                   
                ;
        displayMessage(['\n Cant move that piece! Please choose one of your pieces! ']),
        choosePieceToMove(Player, Board, NewBoard)).
