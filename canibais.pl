
ap([],X,X). 
ap([A|B],C,[A|D]) :- ap(B,C,D).


in(A,[A|_]) :- !. 
in(A,[_|B]) :- in(A,B). 



estrategia(1). 
			  


atingemeta([-E|_]) :- meta(E). 

busca([Caminho|_], Solucao) :- atingemeta(Caminho), !, Solucao = Caminho.
busca([Caminho|Lista], Solucao) :-  
   findall(UMAEXT, estende(Caminho,UMAEXT), EXT), estrategia(Tipo),estrategia(Tipo),
   (Tipo = 1 -> ap(Lista, EXT,  Lista1); 
    Tipo = 2 -> ap(EXT, Lista, Lista1)),
   busca(Lista1, Solucao). 

naorepete(X,C) :- not(in(X,C)). 

estende([OperacaoX-EstadoA|Caminho], [OperacaoY-EstadoB,OperacaoX-EstadoA|Caminho]) :- 
    oper(OperacaoY,EstadoA,EstadoB), 
   naorepete(OperacaoY-EstadoB,Caminho).

margem([F,L,C,R], M) :-
   (F = M -> write('F'); write(' ')),
   (L = M -> write('L'); write(' ')),
   (C = M -> write('C'); write(' ')),
   (R = M -> write('R'); write(' ')).

desenha(Estado) :- 
     write('    '), margem(Estado, a), write('|    |'), margem(Estado,b).

escreve([_-E]) :- write('Estado Inicial: '), write(E), nl, !. 
escreve([O-E|R]) :- 
    escreve(R), 
    write('Executando: '), 
    traduz(O,T),
    write(T), write(' obtemos: '), write(E), nl. 

resolva :-
    inicial(X), 
    busca([[raiz-X]],S),
    escreve(S),
    write('Que é a solução do problema!').

traduz(mc, 'vai 1 missionário e 1 canibal  ').
traduz(vm, 'volta 1 missionário  ').
traduz(cc, 'vai 2 canibais').
traduz(vc, 'volta 1 canibal').
traduz(mm, 'vai 2 missionarios   ').
traduz(vmc, 'volta 1 missionario e 1 canibal   ').

inicial([a,0,0]). 
meta([b,3,3]). 


oper(c1, [a,X,X,Y,Y], [b,1,1,2,2]) :- X < 1. 
oper(c2, [b,X,X,Y,Y], [a,0,1,3,2]) :- Y < 3.
oper(m1, [a,0,Y,3,2], [b,0,3,3,0]) :- Y < 2.
oper(vc, [b,X,Y,Y,X], [a,0,2,3,1]) :- Y < 3.
oper(m2, [a,0,2,X,1], [b,2,2,1,1]) :- X > 2.
oper(cm, [b,X,X,Y,Y], [b,2,2,1,1]) :- X > 1, Y < 2.
oper(m2, [a,0,2,X,1], [b,2,2,1,1]) :- X > 2.
oper(cm, [b,X,Y, Y,X], [a,0,2,3,1]) :- Y < 3.
oper(m1, [a,0,Y, 3,2], [b,0,3,3,0]) :- Y < 2.
oper(c2, [b,X,X, Y,Y], [a,0,1,3,2]) :- Y < 3.
oper(c1, [a,X,X, Y,Y], [b,1,1,2,2]) :- X < 1.
