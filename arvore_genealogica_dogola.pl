pai(joao,ana).
pai(antonio,oridio).
pai(oswaldo,abraao).
pai(oswaldo,oswaldo_jr).
pai(oswaldo,sonia).
pai(oswaldo,marcos).
pai(oswaldo,domingos).
pai(abraao,lucas).
pai(abraao,felipe).
pai(oridio,fabiana).
pai(oridio,fernando).
pai(fernando,thais).
pai(fernando,taciana).
mae(maria,ana).
mae(benedita,oridio).
mae(carolina,abraao).
mae(carolina,oswaldo_jr).
mae(carolina,domingos).
mae(carolina,marcos).
mae(carolina,sonia).
mae(fabiana,felipe).
mae(fabiana,lucas).
mae(ana,fabiana).
mae(ana, fernando).
mae(ana, josiana).
mae(ana, joao_carlos).
irmao1(X,Y) :-mae(Z,X),mae(Z,Y),X \= Y.
irmao2(X,Y) :-pai(Z,X),pai(Z,Y),X \= Y.
avo(Z,Y):-pai(X,Y),pai(Z,X).
avo(Z,Y):-mae(X,Y),pai(Z,X).
avoh(Z,Y):-pai(X,Y),mae(Z,X).
avoh(Z,Y):-mae(X,Y),mae(Z,X).
neto(Z,Y):-avo(Y,Z).
neto(Z,Y):-avoh(Y,Z).
tio(Z,Y):-irmao1(Z,X),mae(X,Y).
tio(Z,Y):-irmao2(Z,X),pai(X,Y).
primo(Z,Y):-tio(V,Y),pai(V,Z).
primo(Z,Y):-tio(V,Y),mae(V,Z).
