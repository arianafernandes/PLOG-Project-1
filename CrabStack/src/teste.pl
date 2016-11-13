board([
         [[empty,empty],[empty],[empty],[empty],[zero]],
         [[zero],[empty],[empty],[empty],[empty]],
         [[empty],[empty],[center],[empty],[empty]],
         [[zero],[empty],[empty],[empty],[empty]],
         [[zero],[empty],[empty],[empty],[zero]]
      ]).

getCell(1, Col, [H | _], Cell):-
        getCellColl(Col, H, Cell).
getCell(Row, Col, [_ | T], Cell):-
        Row > 1, Row < 6,
        Col > 0, Col < 6,
        NewRow is Row - 1,
        getCell(NewRow, Col, T, Cell).

getCellColl(1, [H|_], H).
getCellColl(Col, [_|T1], Cell):-
        Col > 1, Col < 6,
        NewCol is Col-1,
        getCellColl(NewCol, T1, Cell).

% test to getCell: board(X), getCell(5,4,X,[C]). Para sacares o valore atómico tens de por parenteses retos no C, senão tens o C como lista

setCell(1, Col, [H1 | T], Change, [H2 | T]):-
        setCellColl(Col, H1 , Change, H2).
setCell(Row, Col, [H | T1], Change, [H | T2]):-
        NewRow is Row - 1,
        setCell(NewRow, Col, T1, Change, T2).

setCellColl(1, [H1|T], Change, L):-
        append(H1, Change, H2),
        append([H2], T, L).
setCellColl(Col, [H|T1], Change, [H|T2]):-
        NewCol is Col-1,
        setCellColl(NewCol, T1, Change, T2).


emptyCell(1, Col, [H1 | T], [H2 | T]) :-
        emptyCellCol(Col, H1, H2).
emptyCell(Row, Col, [H | T1], [H | T2]):-
        Row > 1, Row < 6,
        NewRow is Row - 1,
        emptyCell(NewRow, Col, T1, T2).

emptyCellCol(1, [_ | T], [[] | T]).
emptyCellCol(Col, [H | T1], [H | T2]):-
        Col > 1, Col < 6,
        NewCol is Col - 1,
        emptyCellCol(NewCol, T1, T2).