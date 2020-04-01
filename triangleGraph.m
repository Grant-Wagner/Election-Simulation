function [ret ret2] = triangleGraph(sample,flag)
[bnum b] = bordaTally(sample,[3 2 1]);
[pnum p] = pluralityTally(sample);
[cnum c] = copelandTally(sample);
space = project(sample);
if flag == 1
    space = space';
    f = figure;
    scatter3(space(1,:),space(2,:),space(3,:),10,bnum,'filled');
    xlabel('First place votes for A'); ylabel('First place votes for B'); zlabel('First place votes for C');
    title('Outcomes under Borda');
    g = figure;
    scatter3(space(1,:),space(2,:),space(3,:),10,pnum,'filled');
    xlabel('First place votes for A'); ylabel('First place votes for B'); zlabel('First place votes for C');
    title('Outcomes under Plurality');
    h = figure;
    scatter3(space(1,:),space(2,:),space(3,:),10,cnum,'filled');
    xlabel('First place votes for A'); ylabel('First place votes for B'); zlabel('First place votes for C');
    title('Outcomes under Copeland');
    comnum = (bnum == pnum) & (bnum == cnum);
    i = figure;
    scatter3(space(1,:),space(2,:),space(3,:),10,comnum,'filled');
    xlabel('First place votes for A'); ylabel('First place votes for B'); zlabel('First place votes for C');
    title('Points of disagreement');
end
space = space';
ret = [space bnum pnum cnum];
ret2 = sample;
end