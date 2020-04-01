function ret = generateReducedTallyMatrix(A)
B = zeros(size(A,1),size(A,2));
for i=1:size(B,2)
    vec = A(:,i);
    vec = vec(vec ~= 0);
    idx = vec(1);
    B(idx,i) = 1;
end
ret = B;
end
    