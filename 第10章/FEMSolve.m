% 求解有限元方程
function hFEM = FEMSolve(hFEM, vertdisind, R)
K = hFEM.K;
hFEM.vertdis = SolveFEM(vertdisind, R, K);
for i = 1:hFEM.elecount
    hFEM.eletruct(i).vertdis(1:2:5) = hFEM.vertdis(2*hFEM.eleindex(i, :) - 1); % u
    hFEM.eletruct(i).vertdis(2:2:6) = hFEM.vertdis(2*hFEM.eleindex(i, :)); % v
end
end