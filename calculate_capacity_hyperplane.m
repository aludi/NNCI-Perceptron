function C = calculate_capacity_hyperplane(P, N)

if P <= N
    C = 2^P;
else
   sum = 0;
   for i = 0 : N-1
       s = nchoosek(P-1, i);
       sum = sum + nchoosek(P-1, i);
   end
   C = 2*sum;
end


