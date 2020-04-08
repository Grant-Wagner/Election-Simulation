function votingStatisticSummary(sample)
fileID = fopen('profileSummary.txt','w');
[bnum bcha] = bordaTally(sample, [3 2 1]);
[cnum ccha] = copelandTally(sample);
[pnum pcha] = pluralityTally(sample);
[inum icha] = irvTally(sample);
V = sum(sample(1,:));
wins = zeros(4,4);
for i=1:size(sample,1)
    for j=1:3
    wins(j,1) = wins(j,1) + (bnum(i) == j);
    wins(j,2) = wins(j,2) + (cnum(i) == j);
    wins(j,3) = wins(j,3) + (pnum(i) == j);
    wins(j,4) = wins(j,4) + (inum(i) == j);
    end
end
fprintf(fileID,'Candidate A won %8.4f percent of the time under Borda \n \n',wins(1,1)/size(sample,1)*100);
fprintf(fileID,'Candidate B won %8.4f percent of the time under Borda \n \n',wins(2,1)/size(sample,1)*100);
fprintf(fileID,'Candidate C won %8.4f percent of the time under Borda \n \n',wins(3,1)/size(sample,1)*100);
fprintf(fileID,'Candidate A won %8.4f percent of the time under Copeland \n \n',wins(1,2)/size(sample,1)*100);
fprintf(fileID,'Candidate B won %8.4f percent of the time under Copeland \n \n',wins(2,2)/size(sample,1)*100);
fprintf(fileID,'Candidate C won %8.4f percent of the time under Copeland \n \n',wins(3,2)/size(sample,1)*100);
fprintf(fileID,'Candidate A won %8.4f percent of the time under Plurality \n \n',wins(1,3)/size(sample,1)*100);
fprintf(fileID,'Candidate B won %8.4f percent of the time under Plurality \n \n',wins(2,3)/size(sample,1)*100);
fprintf(fileID,'Candidate C won %8.4f percent of the time under Plurality \n \n',wins(3,3)/size(sample,1)*100);
fprintf(fileID,'Candidate A won %8.4f percent of the time under IRV \n \n',wins(1,4)/size(sample,1)*100);
fprintf(fileID,'Candidate B won %8.4f percent of the time under IRV \n \n',wins(2,4)/size(sample,1)*100);
fprintf(fileID,'Candidate C won %8.4f percent of the time under IRV \n \n',wins(3,4)/size(sample,1)*100);

fprintf(fileID,'\n \n');

fprintf(fileID,'Borda violated Majority Criterion %8.4f percent of the time \n \n',...
    violatesMajority([sample bnum])/size(sample,1)*100);
fprintf(fileID,'Borda violated Condorcet Criterion %8.4f percent of the time',...
    violatesCondorcet([sample bnum])/size(sample,1)*100);
%  for i=1:size(sample,1)
%      fprintf(fileID,'%d %d %d %d %d %d \n',...
%          sample(i,1),sample(i,2),sample(i,3),sample(i,4),sample(i,5),sample(i,6));
%  end
fclose(fileID);
%load profileSummary.txt;
end