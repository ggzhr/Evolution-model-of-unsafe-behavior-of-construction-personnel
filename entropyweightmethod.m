function result = entropyweightmethod()
R=xlsread('Expert Ratings.xlsx','Sheet1'); 
[rows,cols]=size(R);  
 
Rmin = min(R);        
Rmax = max(R);         
A = max(R) - min(R);  
 
y = R - repmat(Rmin,rows,1);     
for j = 1 : cols                  
     y(:,j) = y(:,j)/A(j);
end
 
S = sum(y,1);                    
 
for i = 1 : cols                  
    Y(:,i) = y(:,i)/S(i); 
end

k=1/log(rows);                 
lnYij1=zeros(rows,cols);         
for i=1:rows                        
    for j=1:cols
        if Y(i,j)==0
            lnYij1(i,j)=0;
        else
            lnYij1(i,j)=log(Y(i,j));  
        end
    end
end
ej1=-k*(sum(Y.*lnYij1,1));            
 
weights1=(1-ej1)/(cols-sum(ej1));  
 
 
result(1).entropy = ej1;          
result(1).weight = weights1;      