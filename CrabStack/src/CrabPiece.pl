%%Cada Caranguejo tem um determinado tamanho e determinada cor consoante o seu jogador

%crab(Color,Size,NumMoves).

%isCrab(crab(+Color,+Size,+NumMoves)).
isCrab(crab(_,_,_)).

%Getters

%getColor(crab(+Color,+Size,+NumMoves),-Color).
getColor(crab(Color,_,_),Color).

%getSize(crab(+Color,+Size,+NumMoves),-Size).
getSize(crab(_,Size,_),Size).

%getNumMoves(crab(+Color,+Size,+NumMoves),-NumMoves).
getNumMoves(crab(_,_,NumMoves),NumMoves).
