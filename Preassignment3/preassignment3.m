load('macaque71.mat')

%% Degree and Similarity

%Degree 
[kden,N,K] = density_dir(CIJ);

%Strength
[is,os,~] = strengths_dir(CIJ);

figure;
subplot(1,6,1); hold on
boxplot(is)
ylabel('Inward link strength')
xlabel('All nodes')
 
subplot(1,6,2);
histogram(is)
ylabel('Number of nodes')
xlabel('Link strength')
title('Node in-strength')
 
subplot(1,6,3);
stem(is)
ylabel('Inward link strength')
xlabel('Nodes')

subplot(1,6,4); hold on
boxplot(os)
ylabel('Outward link strength')
xlabel('All nodes')
 
subplot(1,6,5);
histogram(os)
ylabel('Number of nodes')
xlabel('Link strength')
title('Node out-strength')
 
subplot(1,6,6);
stem(os)
ylabel('Outward link strength')
xlabel('Nodes')
%saveas(gcf,'Link_Strength.png')

%Joint Degree 
[J,J_od,J_id,J_bl] = jdegree(CIJ);

figure;
imagesc(J)
colorbar
title('Joint Degree')
ylabel('Outgoing')
xlabel('Ingoing')
%saveas(gcf,'JoingDegreeMatrix.png')

%Neighborhood Overlap 
[EC,ec,degij] = edge_nei_overlap_bd(CIJ);

figure;
imagesc(EC)
colorbar
title('Edge Neighborhood Overlap Matrix')
ylabel('Nodes-u')
xlabel('Nodes-v')
%saveas(gcf,'NieghborhoodOverlap.png')

%Matching Index 
[Min,Mout,Mall] = matching_ind(CIJ);

figure;
imagesc(Min)
colorbar
title('Matching index for incoming connections')
ylabel('Nodes-u')
xlabel('Nodes-v')
%saveas(gcf,'MatchingINdex.png')


%% Clustering and Community Structure

%Clustering Coefficient
C = clustering_coef_bd(CIJ);

figure;
subplot(1,3,1); hold on
boxplot(C)
ylabel('Clustering coefficient')
xlabel('All nodes')
 
subplot(1,3,2);
histogram(C)
ylabel('Number of nodes')
xlabel('Clustering coefficient')
title('Fraction of triangles around a node')
 
subplot(1,3,3);
stem(C)
ylabel('Clustering coefficient')
xlabel('Node')
%saveas(gcf,'clustering_coef.png')

% Transitivity
T = transitivity_bd(CIJ);

%Community Structure Mod (link communities)
M = link_communities(CIJ, 'single');
 
figure;
imagesc(M)
colorbar
title('Nodal community-affiliation matrix')
ylabel('communities')
xlabel('nodes')
%saveas(gcf,'community-affiliation.png')
 
%Modularity Degeneracy and Consensus Partitioning (Agreement)
%D = agreement(ci) %set of (possibly) degenerate partitions? 

%% Assortativity and Core Structure

%Assortativity
r = assortativity_bin(CIJ,1);

%Rich Club Coefficient
[R,Nk,Ek] = rich_club_bd(CIJ);
figure;
subplot(1,3,1); hold on
boxplot(R)
ylabel('rich-club coefficients')
xlabel('all levels')
 
subplot(1,3,2);
histogram(R)
ylabel('number of levels')
xlabel('rich-club coefficients')
title('The rich club coefficients (R) at levels (k)')
 
subplot(1,3,3);
stem(R)
ylabel('rich-club coefficients')
xlabel('level')
%saveas(gcf,'richClub.png')


%Core Periphery Structure
C = core_periphery_dir(CIJ);
figure;

%K-Core
%[CIJkcore,kn,peelorder,peellevel] = kcore_bd(CIJ)

%% Paths and Distances

%Paths and Walks
%[Pq,tpath,plq,qstop,allpths,util] = findpaths(CIJ,sources,qmax,savepths)
%[Wq,twalk,wlq] = findwalks(CIJ)

%Distance and Characteristic Path Length (retrieve shortest path)
D=distance_bin(CIJ);
figure;
imagesc(D)
colorbar
title('Shortest distance between each pair of nodes')
ylabel('Nodes-u')
xlabel('Nodes-v')
%saveas(gcf,'distance-matrix.png')

%Characteristic Path Length, global efficiency, etc. 
lambda = charpath(CIJ);

%% Efficiency and Diffusion 

% Global efficiency
Eglob = efficiency_bin(CIJ,0);

% Local Efficiency  
Eloc = efficiency_bin(CIJ, 1);
figure;
subplot(1,3,1); hold on
boxplot(Eloc)
ylabel('Global efficiency in the neighborhood of the node')
xlabel('All nodes')
 
subplot(1,3,2);
histogram(Eloc)
ylabel('Number of nodes')
xlabel('Efficiency')
title('Local Efficiency')
 
subplot(1,3,3);
stem(Eloc)
ylabel('Global efficiency in the neighborhood of the node')
xlabel('node')
%saveas(gcf,'LocalEfficiency.png')

%Mean first Passage Time
MFPT = mean_first_passage_time(CIJ);
figure;
imagesc(MFPT)
colorbar
title('Pairwise mean first passage time')
ylabel('Nodes-u')
xlabel('Nodes-v')
%saveas(gcf,'mfpt-matrix.png')

%Diffusion Efficiency 
[GEdiff,Ediff] = diffusion_efficiency(CIJ);
figure;
imagesc(Ediff)
colorbar
title('Pair-wise diffusion efficiency')
ylabel('Nodes-u')
xlabel('Nodes-v')
%saveas(gcf,'DiffusionEfficiency .png')

%% Centrality 

% Betweenness Centrality 
BC = betweenness_bin(CIJ);
figure;
subplot(1,3,1); hold on
boxplot(BC)
ylabel('Betweenness centrality')
xlabel('All nodes')
 
subplot(1,3,2);
histogram(BC)
ylabel('Number of nodes')
xlabel('Betweenness centrality')
title('Node betweenness centrality')
 
subplot(1,3,3);
stem(BC)
ylabel('Betweenness centrality')
xlabel('Node')
%saveas(gcf,'BetweennessCentrality.png')

%Edge Betweenness Cantrality 
[EBC,BC] = edge_betweenness_bin(CIJ);
figure;
imagesc(EBC)
colorbar
title('Edge Betweenness Cantrality')
ylabel('Edges-u')
xlabel('Edges-v')
%saveas(gcf,'EdgeBetweenness.png')

%Within-module degree z-score
%Z=module_degree_zscore(CIJ,1)

%Participation and Related Coefficients
%P=participation_coef(CIJ,1)
 
%K-coreness Centrality 
%[CIJkcore,kn,peelorder,peellevel] = kcore_bd(CIJ)

%Flow Coefficient
%[fc,FC,total_flo] = flow_coef_bd(CIJ)

%Shortcuts
%[Erange,eta,Eshort,fs] = erange(CIJ)

%% Motifs

%Structural Motifs
[f,F] = motif3struct_bin(CIJ);

figure;
subplot(1,5,1); hold on
boxplot(f)
ylabel('Motif frequency')
xlabel('Structural motifs')
 
subplot(1,5,2);
histogram(f)
ylabel('Number of structural motifs')
xlabel('Motif frequency')
 
subplot(1,5,3);
stem(f)
ylabel('Motif frequency')
xlabel('Structural motifs')

subplot(1,5,[4,5]);
imagesc(F)
colorbar
ylabel('Structural motifs')
xlabel('Nodes')
%saveas(gcf,'StructuralMotifs.png')


%Functional Motifs
[f,F] = motif3funct_bin(CIJ);

figure;
subplot(1,5,1); hold on
boxplot(f)
ylabel('Motif frequency')
xlabel('Functional motifs')
 
subplot(1,5,2);
histogram(f)
ylabel('Number of functional motifs')
xlabel('Motif frequency')
 
subplot(1,5,3);
stem(f)
ylabel('Motif frequency')
xlabel('Functional motifs')

subplot(1,5,[4,5]);
imagesc(F)
colorbar
ylabel('Functional motifs')
xlabel('Nodes')
%saveas(gcf,'FunctionalMotifs.png')










