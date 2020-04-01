function codevectorsUpdated = codevectorsUpdated(data, codevectors, learningRate)
% choose a data point randomly
random_datapoint = data(randsample(data:7,1),:);
% compute distanes of all codevetors to the data point
v = size(codevectors, 1);
roh = size(codevectors, 2);
index_sum = 0;
old_row = 1;
distances = [];

for row = 1:v
  for col = 1:roh
      curr_row = row;
      if curr_row == old_row
          if col == 1
            index_sum = codevectors(row,col);
          else 
            index_sum = index_sum - codevectors(row,col);
            distance_between_points = sqrt((index_sum)^2 + (random_datapoint(1,1) - random_datapoint(1,2))^2);
            distances(end+1) = distance_between_points;
            index_sum = 0;
            old_row = curr_row + 1;
          end
      end
  end
end

% determine winning codevetor
[M,I] = max(distances);
winner_vector = codevectors(I,:);
% compute changes to winner's components
updating_winner_vector = [];
mean_of_input_vector = mean(random_datapoint);
for row = 1:length(winner_vector)
    updating_winner_vector(end+1) = winner_vector(row) + learningRate*(mean_of_input_vector - winner_vector(row));
end
% assign codevetors with the winner updated to codevetorsUpdated
codevectors(I,:) = updating_winner_vector;
codevectorsUpdated = codevectors;
end

