function u = heatmap(candidate, sample)
[x y] = triangleGraph(sample,0);
p = find(x(:,4) == candidate);
q = zeros(3,length(p));
for i=1:length(p)
    q(1,i) = x(p(i),1);
    q(2,i) = x(p(i),2);
    q(3,i) = x(p(i),3);
end
q = q';
u = unique(q,'rows','sorted');
ui = zeros(length(u),1);
for i=1:length(u)
for j=1:length(q)
ui(i,1) = ui(i,1) + isequal(q(j,:),u(i,:));
end
end
u = [u ui];
% for i=1:length(u)
%     u(i,4) = 1000*u(i,4)/((u(i,1)+1)*(u(i,2)+1)*(u(i,3)+1));
% end
% scatter3(u(:,1),u(:,2),u(:,3),10,u(:,4),'filled')
end