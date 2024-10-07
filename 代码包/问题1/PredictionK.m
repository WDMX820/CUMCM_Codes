clear;
clc;
data = xlsread('D:\CUMCM2022problems\问题1.3K.xlsx');
S = data(:, 19);
f = [1.39695 -8.39812 12.8537];
A = [1 1 1; -1 -1 -1];
B = [1.05 0.85];
Aeq = [1.39695 -8.39812 12.8537];
lb = [0.5901 0 0];%x1,x2,x3的下界
ub = [0.8705 0.0198 0.0047];%x1,x2,x3的上界
for i = 1:length(S)
    Beq = S(i)+0.309336;
    x(:,i) = linprog(f, A, B, Aeq, Beq, lb, ub);
end