%N_a = 20;
%alpha = 2;
%P = round(N*alpha);
%sum = 0;
%for i = 1 : N-1
%   sum = sum + nchoosek(P-1, i);
%end
%C = 2*sum;
%power = 2^P;
%prob_outcome = C/power

alpha = 0.75:0.25:3;
N = {200}
P_ls = alpha;
for N_idx = 1:length(N)
    for alpha_idx = 1 : 10
       sum = 0;
       alpha(alpha_idx);
       N{N_idx};
       P = round(alpha(alpha_idx) * N{N_idx});
       P;
       test = 0
       if P > N{N_idx}
           for i = 0 : N{N_idx}-1
               s = nchoosek(P-1, i);
               sum = sum + nchoosek(P-1, i);
           end
           
          
            C = 2*sum;
            P_ls(alpha_idx) = C/2^P;
       else
           P_ls(alpha_idx) = 2^P/2^P;
       end
    end

    plot(alpha, P_ls, '-o'); 
    hold on
end
%
% alpha = 2.7500
% prob_outcome - 0.0201