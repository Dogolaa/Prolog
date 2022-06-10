pai(oswaldo,abraao).
pai(abraao,lucas).
pai(abraao,felipe).
pai(oridio,fabiana).
mae(carolina,abraao).
mae(fabiana,felipe).
mae(fabiana,lucas).
mae('Ana Olivia',fabiana).
mae('Ana Olivia', joao).
irmao(X,Y) :-mae(Z,X),mae(Z,Y),X \= Y.
avo_paterno(Z,Y):-pai(X,Y),pai(Z,X).
avo_materno(Z,Y):-mae(X,Y),pai(Z,X).
avoh_paterna(Z,Y):-pai(X,Y),mae(Z,X).
avoh_materna(Z,Y):-mae(X,Y),mae(Z,X).
tio_materno(Z,Y):-irmao(Z,X),mae(X,Y).

