function ret = generateTable(n)
% n is the number of candidates in the race
%
% This method generates a lexicographically ordered
% preference table on n candidates by utilizing kthperm. 
% It stores the table as a matrix and returns it
N = factorial(n);
A = zeros(n,N);
for i=1:N
    a = kthperm(n,i);
    for k=1:n
        A(k,i) = a(k);
    end
end
ret = A;
end