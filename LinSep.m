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




