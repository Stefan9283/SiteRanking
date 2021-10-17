function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eroarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
R=[];

fid=fopen(nume,"r");
file=dlmread(fid);
fclose(fid);

[K M]=genMatrix(nume);

N=file(1,1);

Rold(1:N)=1/N;
Rold=Rold';

K=inv(K);

M=(K*M)';



while 1

	R=d*M*Rold+(1-d)/N*ones(N,1);
	if norm(R-Rold) <= eps
		break
	endif
	Rold=R;

endwhile

R=Rold;


