% 计算三角形面积
function area = CalcTriangleArea(ele)
A(:, 2:3) = ele;
A(:, 1) = 1;
area = 0.5*det(A);
end