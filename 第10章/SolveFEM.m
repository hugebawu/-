function vertdis = SolveFEM(vertdisind, R, K)
vertdis = vertdisind;
ind = find(vertdisind ~= 0);
Krule = K(ind, ind);
Rrule = R(ind);
vertdis(ind) = Krule\Rrule;
end