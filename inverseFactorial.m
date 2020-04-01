function ret = inverseFactorial(N)
n = 1;
while N > 1
    N = N/n;
    n = n+1;
end
ret = n-1;
end