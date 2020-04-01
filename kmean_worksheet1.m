addpath('nethelp3')
addpath('netlab3')

data_points = [1 1
               2 1
               3 1
               5 5
               5 6
               6 5
               6 6];
           
 data_points_x = data_points(:,1);
 data_points_y = data_points(:,2);

code_vectors = [2 2;
               2 3];
           
winner_vectors = codevectorsUpdated(data_points, code_vectors, 0.3);
disp(winner_vectors)
options = foptions();

code_vectors_after_kmeans = kmeans(code_vectors, data_points, options);

code_vectors_x = code_vectors_after_kmeans(:,1);
code_vectors_y = code_vectors_after_kmeans(:,2);
           
scatter(data_points_x,data_points_y, 'b')
hold on
scatter(code_vectors_x,code_vectors_y, 'k')
hold off
    