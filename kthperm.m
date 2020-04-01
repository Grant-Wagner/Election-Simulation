function p = kthperm(n, k)
% P=KTHPERM(N, K) return the kth permutation in lexicographical order.
% k mustn't exceed factorial(n)
%{
%example1:
    kthperm(5, 2) produce:    1     2     3     5     4
    kthperm(5, 120) produce:  5     4     3     2     1

%example2:
    for ii=1:24
        p = kthperm(4, ii);
        fprintf('%2dth perm: %s\n', ii, num2str(p));
    end
% produce:
     1th perm: 1  2  3  4
     2th perm: 1  2  4  3
     3th perm: 1  3  2  4
     4th perm: 1  3  4  2
     5th perm: 1  4  2  3
     6th perm: 1  4  3  2
     7th perm: 2  1  3  4
     8th perm: 2  1  4  3
     9th perm: 2  3  1  4
    10th perm: 2  3  4  1
    11th perm: 2  4  1  3
    12th perm: 2  4  3  1
    13th perm: 3  1  2  4
    14th perm: 3  1  4  2
    15th perm: 3  2  1  4
    16th perm: 3  2  4  1
    17th perm: 3  4  1  2
    18th perm: 3  4  2  1
    19th perm: 4  1  2  3
    20th perm: 4  1  3  2
    21th perm: 4  2  1  3
    22th perm: 4  2  3  1
    23th perm: 4  3  1  2
    24th perm: 4  3  2  1
%}

p = zeros(1, n);
s = 1:n;
k = double(k);
base = double(1);
for jj=2:n-1, base = base*jj; end

for ii=1:n-1
    idx = floor((k-1) / base) + 1;
    p(ii) = s(idx);
    s(idx) = [];
    k = k - base*(idx-1);
    base = base/(n-ii);
end
p(end) = s;
