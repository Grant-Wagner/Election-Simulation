function [num cha] = pluralityTally(sample)
% n is the number of candidates in the election
% sample is the sample set of schedules
%
% This method is a sub-method of bordaTally used to find
% the outcome vector of a given sample of schedules under
% the plurality method. It returns this vector
N = size(sample,2);
w = zeros(1,N);
w(1) = 1;
[num cha] = bordaTally(sample,w);
end