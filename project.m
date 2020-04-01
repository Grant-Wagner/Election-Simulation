function ret = project(sample)
N = size(sample,2);
n = inverseFactorial(N);
projection = zeros(size(sample,1),n);
table = generateTable(n);
w = zeros(1,N);
w(1) = 1;
firstPlaceTallyMatrix = generateTallyMatrix(table,w);
for i=1:size(sample,1)
    projection(i,:) = firstPlaceTallyMatrix*sample(i,:)'; 
end
ret = projection;
end
    
