function [num cha fin tal] = copelandTally(sample);
global alphabet;
alphabet = [65 66 67 68 69 70 71 72 73 74 84];
N = size(sample,2);
n = inverseFactorial(N);
A = zeros(nchoosek(n,2),N);
B = generateTable(n);
C = colex(2,n,0,1).';
V = sum(sample(1,:)); %total number of voters
% This loop just constructs the tally matrix
for i=1:nchoosek(n,2)
    v = C(:,i);
    idx = find(v == 1);
    D(:,i) = idx.';
    for k=1:N
        p = find(B(:,k) == idx(1));
        q = find(B(:,k) == idx(2));
        A(i,k) = (q > p);
end
end
finalvote = zeros(length(sample(:,1)),n);
tally = zeros(length(sample(:,1)),nchoosek(n,2));
for k=1:length(sample(:,1))
tally(k,:) = A*sample(k,:).';
for i=1:nchoosek(n,2)
    v1 = tally(k,i);
    v2 = V-v1;
    finalvote(k,D(1,i)) = finalvote(k,D(1,i)) + (v1 > v2);
    finalvote(k,D(1,i)) = finalvote(k,D(1,i)) + 1/2*(v1 == v2);
    finalvote(k,D(2,i)) = finalvote(k,D(2,i)) + (v2 > v1);
    finalvote(k,D(2,i)) = finalvote(k,D(2,i)) + 1/2*(v1 == v2);
end
end
[maxim outcome] = max(finalvote,[],2);
outcomechar = zeros(length(outcome),1);
% this finds ties and tidies up the outcome vector
for k=1:length(finalvote(:,1))
    outcomechar(k) = alphabet(outcome(k));
    idx = find( finalvote(k,:) == max(finalvote(k,:)) );
    if length(idx) > 1
        outcomechar(k) = alphabet(11);
        outcome(k) = 0;
    end
end
num = outcome;
cha = char(outcomechar);
fin = finalvote;
tal = tally;
end