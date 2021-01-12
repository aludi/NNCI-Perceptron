N = 20;
alpha = 3;
P = round(N*alpha)
sum = 0;
for i = 0 : N-1
    nchoosek(P-1, i)
   sum = sum + nchoosek(P-1, i);
end
sum
C = 2*sum
power = 2^P;
prob_outcome = C/power

