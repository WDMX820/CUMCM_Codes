%高钾玻璃多元线性回归拟合
%RegressionK.m
clear;
clc;
data = xlsread('D:\CUMCM2022problems\问题1.2K.xlsx');%导入高钾玻璃风化程度和化学成分数据
y = data(:,1);%高钾玻璃风化等级
x1 = data(:,4);%二氧化硅
x2 = data(:,5);%氧化钠
x3= data(:,6);%氧化钾
x4 = data(:,7);%氧化钙
x5 = data(:,8);%氧化镁
x6 = data(:,9);%氧化铝
x7 = data(:,10);%氧化铁
x8 = data(:,11);%氧化铜
x9 = data(:,12);%氧化铅
x10 = data(:,13);%氧化钡
x11 = data(:,14);%五氧化二磷
x12 = data(:,15);%氧化锶
x13 = data(:,16);%氧化锡
x14 = data(:,17);%二氧化硫
X = [ones(size(y)) x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14];
[b, bint, r, rint, stats] = regress(y,X);%回归系数，回归系数区间估计，残差，置信区间
stepwise(X(:, 2:end), y)%逐步回归
rcoplot(r, rint)%画出残差图






