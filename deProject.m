function ret = deProject(vA,vB,vC)
A = colex(vA,2,0,vA);
B = colex(vB,2,0,vB);
C = colex(vC,2,0,vC);
X = zeros(size(A,1)*size(B,1)*size(C,1),6);
for j=1:size(A,1)
    for i=1:size(B,1)*size(C,1)
        X(i+(j-1)*size(B,1)*size(C,1),1) = A(j,1);
        X(i+(j-1)*size(B,1)*size(C,1),2) = A(j,2);
    end
end

for q=1:size(A,1)
    for k=1:size(B,1)
        for p=1:size(C,1)
            X(p+(k-1)*size(C,1)+(q-1)*size(B,1)*size(C,1),3) = B(k,1); 
            X(p+(k-1)*size(C,1)+(q-1)*size(B,1)*size(C,1),4) = B(k,2);
        end
    end
end
i = 0;
while i < length(X)
    i = i+1;
    k = mod(i,size(C,1));
    if k == 0
        k = size(C,1);
    end
    X(i,5) = C(k,1);
    X(i,6) = C(k,2);
end

ret = X;

end



    