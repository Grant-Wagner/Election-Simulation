n = 100;
t = linspace(0,1,n);
f = zeros(3,n);
f(1,:) = 1 + 2.*t;
f(2,:) = 0 + 2.*t;
f(3,:) = 0 + t;
sampleSize = 10000;
sample = generateSample(100,3,21,sampleSize);
data = zeros(n,sampleSize);
for i=1:n
    data(i,:) = bordaTally(sample,f(:,i)).';
end
sample = sample.';
space = zeros(3,sampleSize);
space(1,:) = sample(1,:)+sample(2,:);
space(2,:) = sample(3,:)+sample(4,:);
space(3,:) = sample(5,:)+sample(6,:);
colormap(lines);
f = figure;
for k=1:n
    scatter3(space(1,:),space(2,:),space(3,:),10,data(k,:),'filled');
    caxis([0 10]);
    pause(.25)
end