function [num cha] = irvTally(sample)
global alphabet
alphabet = [65 66 67 68 69 70 71 72 73 74 84];
N = size(sample,2);
n = inverseFactorial(N);
firstPlace = project(sample);
table = generateTable(n);
num = zeros(size(sample,1),1);
cha = zeros(size(sample,1),1);
for i=1:size(sample,1)
    table2 = table;
    for k = n:-1:3
        vec = firstPlace(i,:);
        vec = vec(vec ~= 0);
        minim = min(vec);
        idx = find(firstPlace(i,:) == minim);
        % if there are two candidates with the same minimum number
        % of votes the method cannot continue
        if length(idx) > 1
            break
        end
        for j=1:size(table2,2)
            idx2 = find(table(:,j) == idx);
            table2(idx2,j) = 0;
        end
        tally2 = generateReducedTallyMatrix(table2);
        firstPlace(i,:) = tally2*sample(i,:)';
    end
    if length(find(firstPlace(i,:) == 0)) == n-2
        [maxim idx] = max(firstPlace(i,:));
        num(i,1) = idx;
        cha(i,1) = char(alphabet(num(i,1)));
    else
        cha(i,1) = alphabet(11);
    end
    cha = char(cha);
end