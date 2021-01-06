N = 4;

w = randn(N, 1);
norm_w = w / norm(w);
w_star = sqrt(N)*norm_w;
norm(w_star)^2 % check: this should be equal to N

P = 10;

matrix = zeros(P, N + 1);

for pattern_idx = 1:P
    pattern = randn(N, 1);
    S = sign(w_star' * pattern);
    pattern(N+1, 1) = S;
    matrix(pattern_idx, :) = pattern';  % patterns and output are stored as row vectors in P x N + 1 matrix
end

W = zeros(N, 1);
n = 100;
p = P;
E = 1;

% for the first epoch, pick the first pattern
chosen_pattern = matrix(1, :);
lowest_stability_found = -1
for epoch = 1:n
   flag = 0;
   
   for pattern = 1:p
       dot_prod = dot(W, matrix(pattern, 1:N))
       S = matrix(pattern, N+1)
       norm_weights = norm(W)
       stability_pattern = (dot(W, matrix(pattern, 1:N)) * matrix(pattern, N+1))/norm(W)
       
   end
   if stability_pattern < lowest_stability_found
           W = W + (1/N) * (matrix(pattern_presented, 1:N)' * matrix(pattern_presented, N+1));
           flag = 1;
   end
   if flag == 0
       %fprintf("All E's are okay (E > 0)  after %d epochs! Done!\n", epoch)
       success_iter = success_iter + 1;
       break
   end
end
fprintf("Done!\n")






