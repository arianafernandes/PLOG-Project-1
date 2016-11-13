%%Cada Caranguejo tem um determinado tamanho e determinada cor consoante o seu jogador

%crab(Color,Size,NumMoves).

%isCrab(crab(+Color,+Size,+NumMoves)).
isCrab(crab(_,_,_)).

%Getters

%getColor(crab(+color,+size,+numMoves),-color).
getColor(crab(color,_,_),color).

%getSize(crab(+color,+size,+numMoves),-size).
getSize(crab(_,size,_),size).

%getNumMoves(crab(+color,+size,+numMoves),-numMoves).
getNumMoves(crab(_,_,numMoves),numMoves).

%Setters

%setColor(crab(+color,+size,+numMoves),+Color,crab(-color,-size,-numMoves)).
setColor(crab(_,size,numMoves),NewColor,crab(NewColor,size,numMoves)).

%setSize(crab(+color,+size,numMoves),+size,crab(-color,size,-numMoves)).
setSize(crab(color,_,numMoves),NewSize,crab(number,NewSize,numMoves)).

%setNumMoves(crab(+color,+size,numMoves),+numMoves,crab(-color,size,-numMoves)).
setNumMoves(crab(color,size,_),NewNumMoves,crab(number,size,NewNumMoves)).