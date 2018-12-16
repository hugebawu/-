function hFEMele = FEMele(hFEM, ind)
hFEMele.ele = hFEM.verts(hFEM.eleindex(ind, :), :);
hFEMele.B = FEMCalcB(hFEMele);
hFEMele.D = FEMCalcD(hFEM);
hFEMele.S = FEMCalcS(hFEMele);
hFEMele.K = FEMCalcK(hFEM, hFEMele);
end