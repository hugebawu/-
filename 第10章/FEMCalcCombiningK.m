% º∆À„∫œ≥…æÿ’Û
function K = FEMCalcCombiningK(hFEM)
vertcount = hFEM.vertcount;
elecount = hFEM.elecount;
eleindex = hFEM.eleindex;
eleK = zeros(6, 6, elecount);
for k = 1:elecount
    eleK(:, :, k) = hFEM.eletruct(k).K;
end
K = zeros(vertcount*2);
for i = 1:vertcount
    for j = 1:vertcount
        for k = 1:elecount
            indi = find(eleindex(k, :)==i);
            indj = find(eleindex(k, :)==j);
            if ~isempty(indi) && ~isempty(indj)
                K(2*i-1:2*i, 2*j-1:2*j) = K(2*i-1:2*i, 2*j-1:2*j) + eleK(2*indi-1:2*indi, 2*indj-1:2*indj, k);
            end
        end
    end
end
end