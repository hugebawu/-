% º∆À„º∏∫Œæÿ’Û
function B = FEMCalcB(hFEMele)
ele = hFEMele.ele;
A(:, 2:3) = ele;
A(:, 1) = 1;
invA = inv(A);
B(1, 1:2:5) = invA(2, :);
B(2, 2:2:6) = invA(3, :);
B(3, 1:2:5) = invA(3, :);
B(3, 2:2:6) = invA(2, :);
end