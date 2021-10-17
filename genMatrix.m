function [K M]=genMatrix(file)

fid=fopen(file,"r");
file=dlmread(fid);
fclose(fid);
total=file(1,1);

M=zeros(total);

K=zeros(total);


for i=2:total+1

num_de_legaturi=file(i,2);
de_inserat_in_k=num_de_legaturi;

	for j=3:2+num_de_legaturi
		if i-1 == file(i,j)
			de_inserat_in_k--;
		else
		M(i-1,file(i,j))=1;
		endif
	endfor
	M(i-1,i-1)=0;


	K(i-1,i-1)=de_inserat_in_k;

endfor
