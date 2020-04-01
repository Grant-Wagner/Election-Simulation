function [num cha] = bordaTally(sample,w)
global alphabet
alphabet = [65 66 67 68 69 70 71 72 73 74 84];
% n is the number of candidates
% sample is the set of elections we wish to analyze
% w is the weight vector for this Borda
%
% This method takes in a sample, weight vector and
% race size in order to tally the elements of the sample
% using the Borda method
N = size(sample,2);
n = inverseFactorial(N);
table = generateTable(n);
tallyMatrix = generateTallyMatrix(table,w);
sampleSize = size(sample,1);
tally = zeros(length(sample(:,1)),n);
for k=1:length(sample(:,1))
    tally(k,:) = tallyMatrix*sample(k,:).';
end
[maxim,outcomenum] = max(tally,[],2);
outcomechar = zeros(length(outcomenum),1);
for k=1:length(tally(:,1))
    outcomechar(k) = alphabet(outcomenum(k));
    idx = find( tally(k,:) == max(tally(k,:)) );
    % This if finds ties
    if length(idx) > 1
        outcomenum(k) = 0;
        outcomechar(k) = alphabet(11);
    end
end
outcomechar = char(outcomechar);
num = outcomenum;
cha = outcomechar;
end