%% Load data
load('macaque71.mat')

%% Two-dimensional network visualization

[x,y] = adjacency_plot_und(CIJ);    % No coordinates are specified -> each node is assigned a position on a circle.
figure;
plot(x,y);      % Plot the edges   
axis equal
title('The edges')
saveas(gcf,'EdgePlot.png')  % Save image

%% Grid communities

% Compute the community affiliation vector
M = community_louvain(CIJ);

figure;
[X,Y,indsort] = grid_communities(M);    % Compute the argumnets needed in visualization
imagesc(CIJ(indsort,indsort));          % Plot ordered adjacency matrix
hold on;                                % Hold on to overlay community visualization
plot(X,Y,'r','linewidth',2);            % Plot community boundaries
axis equal
title('Grid communities')
ylabel('Reordered nodes')
xlabel('Reordered nodes')
saveas(gcf,'GridCommunities.png')      % Save image

%% Node reordering with simulated annealing

[Mreordered,Mindices,cost] = reorder_matrix(CIJ,'line',1);

figure;
imagesc(Mreordered)
axis equal
title('Reordered connectivity matrix')
ylabel('Reordered nodes')
xlabel('Reordered nodes')
saveas(gcf,'NodeReorderSimulatedAnnealing.png')

%% Node reordering by modular structure

[On,Wr] = reorder_mod(CIJ,M);
figure;
imagesc(Wr)
axis equal
title('Reordered connectivity matrix')
ylabel('Reordered nodes')
xlabel('Reordered nodes')
saveas(gcf,'NodeReorderModularStructure.png')




