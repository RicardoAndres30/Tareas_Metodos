 A = [0 0 2; -1 5 2; 3 6 7];
 b = [2 ; -14; 3];
 
 LU(A,b)
 
function [L,U,P]=LU(A,b)

[n,n]=size(A);

L=eye(n); 
P=L; 
U=A; 

for j = 1:n 
    
    [pivot m] = max(abs(U(j:n,j))); 
    m = m+j-1;
    
    if m ~= j 

        aux = U(j,:);
        aux = P(j,:);
        
        U(j,:) = U(m,:);
        P(j,:) = P(m,:);
        
        U(m,:) = aux;    
        P(m,:) = aux; 
        
        if j >= 2 
            
            aux = L(j,1:j-1);
            L(j,1:j-1) = L(m,1:j-1);
            L(m,1:j-1) = aux;
            
        end 
        
    end
    for i = j+1:n  
        L(i,j) = U(i,j)/U(j,j);
        U(i,:) = U(i,:)-L(i,j)*U(j,:);
    end
    
end

Z=P*b;
Y=inv(L)*Z;

P
L
U

x=inv(U)*Y

end