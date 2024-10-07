%预测附件表单3中风化高钾玻璃在风化前的成分比例
%Predict3K.m
clear;
clc;
data = xlsread('D:\CUMCM2022problems\k-means\问题3.xlsx',2);
S = data(:, 17);
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