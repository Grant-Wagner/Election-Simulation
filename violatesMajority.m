function [ret1 ret2] = violatesMajority(result)
sample = result;
N = size(sample,2);
sample(:,N) = [];
sample = project(sample);
V = sum(sample(1,:));
v = zeros(size(sample,1),1);
count = 0;
q = zeros(1,1);
for i=1:size(sample,1)
    for j=1:size(sample,2)
        if sample(i,j) > V/2
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