clc
clear all
close all
% 数据
choise = 1;
switch choise
    case 1
        verts = [0 0;
            2 0;
            2 2;
            0 2;
            1 1;]*0.2;
        eleindex = [1 5 4;
            2 5 1;
            3 5 2;
            4 5 3];
        vertdisind = [1 1 1 1 0 0 0 0 0 1]';
        R = [0 0 0 0 0 0 0 0 0 -30000]';
    case 2
        verts = [0 2;
            0 1;
            1 1;
            0 0;
            1 0;
            2 0];
        eleindex = [5 2 4;
            6 3 5;
            2 5 3;
            3 1 2];
end
figure
patch('Faces', eleindex, 'Vertices', verts, 'FaceColor', 'r'); % 绘制数据
axis equal
axis off
% 构造FEM
hFEM.vertcount = size(verts, 1);
hFEM.verts = verts;
hFEM.elecount = size(eleindex, 1);
hFEM.eleindex = eleindex;
hFEM.mu = 0;
hFEM.E = 210e9;
hFEM.t = 0.01;
hFEM = FEM(hFEM);
% 求解有限元方程得各节点位移
hFEM = FEMSolve(hFEM, vertdisind, R);
for k = 1:hFEM.vertcount
    fprintf('%d节点的位移:（u，v） = （%g, %g）\n', k, hFEM.vertdis([2*k-1, 2*k]));
end
% 求各单元应力、应变
for k = 1:hFEM.elecount
    ind(1:2:5) = 2*hFEM.eleindex(k, :)-1;
    ind(2:2:6) = 2*hFEM.eleindex(k, :);
    stress = hFEM.eletruct(k).S * hFEM.vertdis(ind);
    strain = hFEM.eletruct(k).B * hFEM.vertdis(ind);
   
    fprintf('第%d单元:\n应力为（%g，%g，%g）\n', k, stress);
    fprintf('应变为（%g，%g，%g）\n', strain);
end




