function ret = generateTallyMatrix(A,w)
% A is a given table for an election
% w is a weight vector for the Borda that will be used
% in the election
%
% This method takes in a given table and weight vector 
% and generates the appropriate tallyMatrix, which is 
% then returned.
B = zeros(size(A,1),size(A,2));
n = inverseFactorial(size(A,2));
p = n - size(A,1);
% run over the columns
for i=1:size(A,2)
    % run over the rows
    for k=1:n
        if w(find(A(:,i) == k))
        B(max(k-p,1),i) = w(find(A(:,i) == k));
    end
end
ret = B;
end