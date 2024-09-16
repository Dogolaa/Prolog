 /*Lista de Exercícios 2*/

/*Exercício 1:
Qual é o resultado das seguintes consultas em Prolog?
?- forall(member(X,[1,2,3]),write(X)).
?- forall(between(1,5,I),(write(I*I),write(' '))).
?- forall(between(10,20,I),write(I:' ')).*/

/*Resposta - 1*/
/*O 'forall' verifica todas as declarações corretas da lista fornecida, 
sendo assim o member verifica o elemento em si e se ele é verdadeiro 
dentro dessa lista.
?- forall(member(X,[1,2,3]),write(X)) 
   retorna -> 1,2,3 
              true
Já o para o between, se verifica quais são os valores entre o intervalo.
?- forall(between(1,5,I),(write(I*I),write(''))). 
   retorna -> 1*12*23*34*45*5
			  true
?- forall(between(10,20,I),write(I:'')).
   retorna -> 10:11:12:13:14:15:16:17:18:19:20:
			  true
*/

/*Exercício 2:
Considere o seguinte programa Prolog:*/
a:-a(0).
a(X):- X > 10, !.
a(X):- write(X), write(' '), X1 is X + 1, a(X1).
/*Qual será o resultado da seguinte consulta Prolog: ?- a.*/

/*Resposta - 2*/
/*Para o programa citado é uma recursão, o retorno é a sequência de 0 a 10. 
Por que a terceira sentença acrescente +1 a X, onde X inicia com 0 e seu 
valor vai até quando o valor foi maior que 10.
	retorna -> 0 1 2 3 4 5 6 7 8 9 10
		   	   true
*/

Ex 3
Precisa iniciar com 0…. esta ininciando com 1

triangle(0).                               
triangle(N):-                              
	N0 is N-1, triangle(N0), writeHalves(N). 

writeHalves(N):-                           
	writeL(1, N), Ns is N-1, writeR(Ns, Ns). 

writeR(0, N):- write('\n').                
writeR(N, N):-                             
	write(N), N0 is N-1, writeR(N0, N0).     

writeL(X, N):-                             
	write(X), X0 is X+1, X\=N, writeL(X0, N).
writeL(N, N).  

Ex 4
o papel do acumulador é armazenar o resultado intermediário durante os calculos

Ex 5
O findall cria uma lista com todos os resultados
retorno
	L = [[0, 0], [0, 1], [1, 0], [1, 1]]

Ex 6

palindrome([]).
palindrome([_]).
palindrome([X|Xs]):-append(Xs1,[X],Xs), palindrome(Xs1).

?- palindrome([a,b,a,b,a]).
retorno
	true

Ex 7

metIguais([]).      
metIguais(L):-append(M,M,L).


Ex 8 

insOrd(X,L,O):-[Y|Ys]=L,X>Y,insOrd(X,Ys,XYs),O=[Y|XYs].
insOrd(X,L,O):-[Y|_]=L,X=<Y,O=[X|L].
insOrd(X,[],[X]).

Ex 9

particiona([X,Y|XYs],[X|Xs],[Y|Ys]):-particona(XYs,Xs,Ys).
particiona([],[],[]).
particiona([X],[X],[]).


Ex 10

merge([],X,X).
merge(X,[],X).
merge([X|Xs],[Y|Ys],R):- X<Y ,R=[X|XYs],merge(Xs,[Y|Ys],XYs).
merge([X|Xs],[Y|Ys],R):- Y=<X,R=[Y|XYs],merge([X|Xs],Ys,XYs). 

Ex 11
Não é utilizado o corte para garantir que quando X > Y a exec~ção da segunda regra não aconteça.

Ex 12

p é igual a a, enquanto p for verdadeiro b é verdadeiro também


Ex 13
igual ao ex 4

Ex 14
