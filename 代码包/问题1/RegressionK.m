%�߼ز�����Ԫ���Իع����
%RegressionK.m
clear;
clc;
data = xlsread('D:\CUMCM2022problems\����1.2K.xlsx');%����߼ز����绯�̶Ⱥͻ�ѧ�ɷ�����
y = data(:,1);%�߼ز����绯�ȼ�
x1 = data(:,4);%��������
x2 = data(:,5);%������
x3= data(:,6);%������
x4 = data(:,7);%������
x5 = data(:,8);%����þ
x6 = data(:,9);%������
x7 = data(:,10);%������
x8 = data(:,11);%����ͭ
x9 = data(:,12);%����Ǧ
x10 = data(:,13);%������
x11 = data(:,14);%����������
x12 = data(:,15);%������
x13 = data(:,16);%������
x14 = data(:,17);%��������
X = [ones(size(y)) x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14];
[b, bint, r, rint, stats] = regress(y,X);%�ع�ϵ�����ع�ϵ��������ƣ��в��������
stepwise(X(:, 2:end), y)%�𲽻ع�
rcoplot(r, rint)%�����в�ͼ






