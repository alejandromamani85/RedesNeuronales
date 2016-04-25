clc;
clear all;

n = 2;

p1 = randperm(n);
p2 = randperm(n);
p3 = randperm(n);

p1 = p1(:);
p2 = p2(:);
p3 = p3(:);

P = [p1, p2, p3];

W = (p1*p1' - eye(n)) + (p2*p2'-eye(n)) + (p3*p3' - eye(n));

[x y] = size(P);

W_fast = P*P' - y*eye(x);

W_slow=zeros(x);
for j=1:y
    W_slow = W_slow + P(:,j)*P(:,j)'-eye(x);
end