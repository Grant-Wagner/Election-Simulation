close all;
X = deProject(33,33,33);
vA = 25; vB = 35; vC = 40;
t1 = X(:,1); t2 = X(:,3); t3 = X(:,5);
x = bordaTally(X,[3 2 1]);
% cWins = zeros(length(x),1);
% for i=1:length(x)
%     cWins(i) = (2*vC-vA+vB > t1(i)+2*t2(i)+t3(i)) && (vC-vB+vA > 2*t1(i)+t2(i)-t3(i));
% end
figure;
scatter3(t1,t2,t3,10,x,'filled');
title('A parallepiped for (25,35,40) under Borda')
figure
scatter3(t1,t2,t3,10,cWins,'filled');
v = [cWins x];
figure
y = copelandTally(X);
scatter3(t1,t2,t3,10,y,'filled');
title('A parallepiped for (25,35,40) under Copeland')
figure
z = irvTally(X);
scatter3(t1,t2,t3,10,z,'filled')
title('A parallelepiped for (25,35,40) under IRV')