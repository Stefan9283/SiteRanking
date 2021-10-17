function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari:
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
R=[];
fid=fopen(nume,"r");
file=dlmread(fid);
fclose(fid);

[K M]=genMatrix(nume);
N=size(M,2);

K=inv(K);

M=(K*M)';
T=eye(N)-d*M;
O=ones(N,1);
B=PR_Inv(T);

R=B*(1-d)/N*O;