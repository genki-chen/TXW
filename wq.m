%% init
clear;
clc;

%% 导入无向距离矩阵
A = [ inf,1,2,3,2,1; 1,inf,1,2,3,2 ;2,1,inf,1,2,3;3,2,1,inf,1,2;2,3,2,1,inf,1;1,2,3,2,1,inf];
i_A = length(A);
for n = 1 : i_A
    tmp(n,:) = zeros(1,i_A);
end
%% P算法
path1 = pirm(A , tmp , i_A);
%% K算法
path2 = kruskal(A , tmp,i_A);
%% 导入有向距离矩阵
B = [ inf , 9 , 1 , 3 , inf , inf ; 1 , inf , 4 , inf , 7, inf ; 2 , inf ,inf , inf , 1 , inf ; inf , inf ,5, inf ,2, 7; inf , 6 , 2 ,8 , inf ,5; 7,inf,2,inf,2,inf];
i_B = length(B);
for n = 1 : i_B
    tmp(n,:) = zeros(1,i_B);
end
%% D算法
[ path3 , way_len ] = dijkstra(B , tmp,i_B);

	

