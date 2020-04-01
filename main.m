function main(V,sampleSize,seed,loopSize,candidateReq)
% this is the main, it does stuff
graphStuff = zeros(1,candidateReq);
rng(seed,'twister');
p = randi([-10000 10000],1,candidateReq);
for k=1:candidateReq
    w(k) = k;
    w = sort(w,'descend');
    graphStuff(k) = mean(shell(k,V,w,sampleSize,p(k)));
end
plot(graphStuff)
end