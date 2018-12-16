% º∆À„”¶¡¶æÿ’Û
function D = FEMCalcD(hFEM)
mu = hFEM.mu;
E = hFEM.E;
D = [1 mu 0;
    mu 1 0;
    0 0 (1-mu)/2]*E/(1-mu^2);
end