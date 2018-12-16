% 计算应力变换矩阵
function S = FEMCalcS(hFEMele)
S = hFEMele.D*hFEMele.B;
end