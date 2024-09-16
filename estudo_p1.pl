analisa_lista([]):- write("Lista Vazia").
analisa_lista([X|Y]):- write("A cabeca eh:"), write(X),nl, write("A cauda eh:"), write(Y).




mais_longa([],[_|_]).
mais_longa([_|B],[_|D]):-mais_longa(B,D).




elemento_n([A|_],1,A).
elemento_n([_|B],X,Y):-V is X-1,elemento_n(B,V,Y).




ocorrencias(_,[],0).
ocorrencias(X,[A|B],Y):-X=A,ocorrencias(X,B,V), Y is V+1.
ocorrencias(X,[_|B],V):-ocorrencias(X,B,V).




minimo([A],A).
minimo([A|B],A):- minimo(B,X), A < X.
minimo([A|B],X):- minimo(B,X), X =< A.




troca([],_,_,[]).
troca([A|B],X,Y,[Y|D]):- A=X,troca(B,X,Y,D).
troca([A|B],X,Y,[A|D]):-troca(B,X,Y,D).

qtd_elementos([],0).
qtd_elementos([_|B],X):- qtd_elementos(B,Y), X is Y+1.

soma_elementos([],0).
soma_elementos([A|B],X):- soma_elementos(B,V),X is V+A.

media([],0).
media(A,X):- soma_elementos(A,H),qtd_elementos(A,D),X is H/D.