% ���㵥Ԫ�նȾ���
function K = FEMCalcK(hFEM, hFEMele)
triarea = CalcTriangleArea(hFEMele.ele);
K = hFEM.t*triarea*hFEMele.B'*hFEMele.D*hFEMele.B;
end