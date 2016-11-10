%%Cada Caranguejo tem um determinado tamanho e determinada cor consoante o seu jogador

%crab(Color,Size).

%isCrab(crab(+Color,+Size)).
isCrab(crab(_,_,_)).

%Getters

%getColor(crab(+Color,+Size),-Color).
getColor(crab(Color,_,_),Color).

%getSize(crab(+Color,+Size),-Size).
getSize(crab(_,Size,_),Size).
