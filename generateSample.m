function ret = generateSample(V,n,seed,sampleSize)
% V is the number of voters
% n is the number of candidates
% seed is for the rng
% sampleSize is the number of elections generated
%
% This method uses the rand_comp method to generate
% a random selection of possible ways the voters
% could rank the candidates, and stores the sample in a 
% matrix P, which is returned. The randomly sampled elections
% obey a multinomial distribution
N = factorial(n);
P = zeros(sampleSize,N);
for i=1:sampleSize
    [a,seed] = comp_random(V,N,seed);
    for k=1:N
        P(i,k) = a(k);
    end
end
ret = P;
end