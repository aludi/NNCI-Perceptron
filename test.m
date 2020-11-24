% testing matlab git

% N = number of dimensions
% P = number of patterns

N = 2;
P = 4;


% generating components
x = linspace(-1,1,1000);
y2 = gaussmf(x, [1, 0]);
plot(x, y2);

matrix = zeros(P, N + 1);

for pattern = 1:P
    idx = randperm(2, 1);
    A = [-1, 1];
    S = A(idx);
    for dimension = 1:N
        matrix(pattern, dimension) = randn();
    end
    matrix(pattern, N + 1) = S;
end

% n = number of epochs
% t = time steps (resets to 1 after reaching P)

n = 100;
t = P;

% W = weights array (size Nx1)
W = zeros(N, 1);

for epoch = 1:n
   flag = 0;
   for pattern_presented = 1:t
       E = dot(W, matrix(pattern_presented, 1:N)) * matrix(pattern_presented, N+1);
       if E <= 0
           W = W + (matrix(pattern_presented, N+1)/N)*matrix(pattern_presented, 1:N)';
           flag = 1;
       end
   end
   if flag == 0
       fprintf("All E's are okay (E > 0)  after %d epochs!\n", epoch)
       break
   end
end

fprintf("We're done training!\n")
