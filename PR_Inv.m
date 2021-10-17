function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se genereaza factorizarea QR apoi se obtine inversa lui A prin rezolvarea sistemului superior triunghiular

N=size(A,2);
[QGS RGS] = GS(A);
I=eye(N);
for i=1:N
B(:,i)=SST(RGS,QGS'*I(:,i));
endfor