%List representing the Tab
board([
         [[x],[empty],[empty],[empty],[x]],
         [[x],[empty],[empty],[empty],[empty]],
         [[empty],[empty],[center],[empty],[empty]],
         [[x],[empty],[empty],[empty],[empty]],
         [[x],[empty],[empty],[empty],[x]]
          ]).

gameInit:-board(T),   
        positionPlayerPieces(1,T).

positionPlayerPieces(N,T):-
        positionSmallPiecies(N,T),
        positionMediumPiecies(N,T),
        positionBigPiecies(N,T).

positionSmallPiecies(N,T).
        