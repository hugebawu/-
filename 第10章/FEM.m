% ����FEM�����ĸ��־���
function hFEM = FEM(hFEM)
% ����ÿ����Ԫ
for i = 1:hFEM.elecount
    hFEM.eletruct(i) = FEMele(hFEM, i);
end
% ����ϳɸնȾ���
hFEM.K = FEMCalcCombiningK(hFEM);
end