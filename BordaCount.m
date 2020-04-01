function ret = BordaCount(V,n)
% V is the number of voters in the election
% n is the number of candidates 
%
% This method returns the number of distinct elections
% under Borda that are possible given this V and n
D = 0;
N = factorial(n);
for k=1:min([V,N])
    D = D + nchoosek(V-1,k-1)*nchoosek(N,k);
end
ret = D;
end
    