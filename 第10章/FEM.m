% 计算FEM分析的各种矩阵
function hFEM = FEM(hFEM)
% 处理每个单元
for i = 1:hFEM.elecount
    hFEM.eletruct(i) = FEMele(hFEM, i);
end
% 计算合成刚度矩阵
hFEM.K = FEMCalcCombiningK(hFEM);
end