%ѵ��BP������
%BP.m
clear;
clc;
data=xlsread('D:\CUMCM2022problems\����2.1.xlsx');
k=rand(1, 67);
[m,n]=sort(k);%�������ݼ�˳��
input=data(:, 6:19);
output1=data(:, 1);%��ǩ
for i=1:67
    switch output1(i)
        case 1
            output(i,:)=[1 0];
        case 2
            output(i,:)=[0 1];
    end
end
input_train=input(n(1:50),:)';%���Һ�����ݼ�ǰ50����ѵ����
output_train=output(n(1:50),:)';
input_test=input(n(51:67),:)';%��17�������Լ�
output_test=output(n(51:67),:)';
%�����������ʼ��
innum=14;
midnum=15;
outnum=2;
w1=rands(midnum,innum);
b1=rands(midnum,1);
w2=rands(midnum,outnum);
b2=rands(outnum,1);
w2_1=w2; w2_2=w2_1;
w1_1=w1; w1_2=w1_1;
b2_1=b2; b2_2=b2_1;
b1_1=b1; b1_2=b1_1;
xite=0.1;
alfa=0.01;
maxgen=100;
%%ѵ��������
for ii=1:maxgen
    error(ii)=0;
    for i=1:1:50
        x=input_train(:,i);
        for j=1:1:midnum
            I(j)=input_train(:,i)'*w1(j,:)'+b1(j);
            Iout(j)=1/(1+exp(-I(j)));%sigmoid
        end
        yn=w2'*Iout'+b2;
        
        e=output_train(:,i)-yn;
        error(ii)=error(ii)+sum(abs(e));
        
        dw2=e*Iout;
        db2=e';
        
        for j=1:1:midnum
            S=1/(1+exp(-I(j)));
            FI(j)=S*(1-S);
        end
        for k=1:1:innum
            for j=1:1:midnum
                dw1(j,k)=FI(j)*x(k)*(e(1)*w2(j,1)+e(2)*w2(j,2));
                db1(j)=FI(j)*(e(1)*w2(j,1)+e(2)*w2(j,2));
            end
        end
        w1=w1_1+xite*dw1;
        w2=w2_1+xite*dw2';
        b1=b1_1+xite*db1';
        b2=b2_1+xite*db2';
        w1_2=w1_1; w1_1=w1;
        w2_2=w2_1; w2_1=w2;
        b1_2=b1_1; b1_1=b1;
        b2_2=b2_1; b2_1=b2;
    end
end
%%���Լ�����׼ȷ��
for i=1:17
    for j=1:1:midnum
        I(j)=input_test(:,i)'*w1(j,:)'+b1(j);
        Iout(j)=1/(1+exp(-I(j)));
    end
    fore(:,i)=w2'*Iout'+b2;
end

for i=1:17
    output_fore(i)=find(fore(:,i)==max(fore(:,i)));
end

Error=output_fore-output1(n(51:67))'; %Ԥ�����

figure(1)
plot(output_fore,'r')
hold on
plot(output1(n(51:67))','b')
legend('Ԥ�ⲣ�����','ʵ�ʲ������')

figure(2)
plot(Error)
title('BP����������','fontsize',12)
xlabel('���Բ������','fontsize',12)
ylabel('�������','fontsize',12)

k=zeros(1,2);  
for i=1:17
    if Error(i)~=0
        [b,c]=max(output_test(:,i));
        switch c
            case 1 
                k(1)=k(1)+1;
            case 2 
                k(2)=k(2)+1;
        end
    end
end
kk=zeros(1,2);
for i=1:17
    [b,c]=max(output_test(:,i));
    switch c
        case 1
            kk(1)=kk(1)+1;
        case 2
            kk(2)=kk(2)+1;
    end
end
rightridio=(kk-k)./kk %׼ȷ��