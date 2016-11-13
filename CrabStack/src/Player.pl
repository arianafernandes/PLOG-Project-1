%player(+number,+numPieces).


%isPlayer(player(+number,+numPieces)).
isPlayer(player(_,_)).

%Getters

%getNumber(player(+number,+numPieces),-number).
getNumber(player(number,_),number).

%getNumPieces(player(+number,+numPieces),-numPieces).
getNumPieces(player(_,numPieces),numPieces).

%Setters

%setNumber(player(+number,+numPieces),+number,player(-number,-numPieces,)).
setNumber(player(_,numPieces),NewNumber,player(NewNumber,numPieces)).

%setNumPieces(player(+number,+numPieces),+numPieces,player(-number,-numPieces,)).
setNumPieces(player(number,_),NewNumPieces,player(number,NewNumPieces)).