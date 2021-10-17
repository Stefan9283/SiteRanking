function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out

PR1=Iterative(nume,d,eps);
PR2=Algebraic(nume,d);

fid=fopen(nume,"r");
file=dlmread(fid);
fclose(fid);
N=file(1,1);



val1=file(N+2,1);
val2=file(N+3,1);

PR3(:,1)=1:N;
PR3(:,2)=PR1;
for i=1:N
PR3(i,2)=Apartenenta(PR3(i,2),val1,val2);
endfor

PR3=sortrows(PR3,-2);

out=[nume,".out"];

fid=fopen(out,"w");
fprintf(fid,"%d\n\n",N);
fclose(fid);

fid=fopen(out,"a");

for i=1:N
fprintf(fid,"%f\n",PR1(i));
endfor

fprintf(fid,"\n");

for i=1:N
fprintf(fid,"%f\n",PR2(i));
endfor

fprintf(fid,"\n");

for i=1:N
fprintf(fid,"%d %d %f\n",i,PR3(i,1),PR3(i,2));
endfor


fclose(fid);
