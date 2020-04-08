function [ret1 ret2] = violatesCondorcet(result)
sample = result;
N = size(sample,2);
sample(:,N) = [];
N = N-1;
n = inverseFactorial(N);
[num cha fin tal] = copelandTally(sample);
v = zeros(size(sample,1),1);
winner = n-1;
count = 0;
q = zeros(1,1);
for i=1:size(sample,1)
    for j=1:n
        if fin(i,j) == winner
            v(i) = j;
            if v(i) ~= result(i,size(result,2))
                count = count + 1;
                q = [q i];
            end
        end
    end
end

ret1 = count;
ret2 = q;
end