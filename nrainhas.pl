solucao(N,S) :- 
     crialista(N,L),
     criasup(N,DS),
     criainf(N,DI),
     resolve(S,L,L,DS,DI), 
     tabela(N, S).


resolve([], [], _, _, _). 
						  

resolve([C|LC], [L|LL], CO, DS, DI) :- 
    apaga(C, CO, CO1), 
    NS is L - C, 
    apaga(NS, DS, DS1), 
    					
    NI is L + C, 
    apaga(NI, DI, DI1), 
    					
    resolve(LC, LL, CO1, DS1, DI1). 

apaga(X,[X|Y],Y). 
apaga(A,[B|C],[B|D]) :- apaga(A,C,D).

crialista(N,[N|L]):-N > 0, N1 is N-1, crialista(N1,L). 
crialista(0,[]). 

criasup(C, L) :- A is C*(-1)+1, B is C-1, 
    findall(N, between(A,B,N), L). 
criainf(C, L) :- B is C*2, 
    findall(N, between(2,B,N), L). 

linha(0, _) :- !. 
linha(N, X) :- N1 is N - 1, linha(N1, X), (N =:= X -> write('r'); write('_')),
    		   							  (N =:= 4 -> write(''); write(',')). 
										  

desenhar(0, _, []) :- !. 
desenhar(N1, N2, [A|B]) :- write(' [ '), linha(N2, A), write(' ] '), 
    																 
    					   N1Aux is N1 - 1, desenhar(N1Aux, N2, B).
						   

tabela(N, S) :- desenhar(N, N, S). 

