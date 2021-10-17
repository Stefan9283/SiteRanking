function w = SST(A, b)

[b1 b2]=size(b);
x=b;
[n n]=size(A);
    for i=n:-1:1

        for j=n:-1:i+1
        x(i)=x(i)-A(i,j)*x(j);
        end

        x(i)=x(i)/A(i,i);

    end

x;
w=x(1:n);
end


