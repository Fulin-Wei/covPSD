%小波变换，分为单尺度分解和多尺度分解
%程序来源：https://www.onlinedown.net/soft/1161360.html

%一些相关的matlab函数用法解释
% [cA,cD]=dwt(X,'wname')
%    使用小波'wname'对信号X进行单层分解，求得的近似系数存放在数组cA中，细节系数存放在数组cD中
%    返回的cA，cD分别存放是信号的近似和细节
%    [C,L]=wavedec(X,N,'wname')
%    利用小波'wname'对信号X进行多层分解
%    A=appcoef(C,L,'wname',N)
%    利用小波'wname'从分解系数[C,L]中提取第N层近似系数
%    [C,L]=wavedec(X,1,’wname’)中返回的近似和细节都存放在C中，即C=[cA,cD]，L存放是近似和各阶细节系数对应的长度
%  
%    DWT2是二维单尺度小波变换，其可以通过指定小波或者分解滤波器进行二维单尺度小波分解
%    DWT2的一种语法格式是[cA,cH,cV,cD]=dwt2(X,'wname')
% 
%    WAVEDEC2是二维多尺度小波分解
%    WAVEDEC2的语法格式是[C,S]=wavedec2(X,N,'wname')，其中N为大于1的正整数
%   也就是说DWT2只能对某个输入矩阵X进行一层分解，而WAVEDEC2可以对输入矩阵X进行N层分解


% %matlab给出的dwt小波变换的实例
% %Obtain the single-level DWT of the noisy Doppler signal using a wavelet name.
% clear;clc;close all;
% load noisdopp;
% [cA,cD] = dwt(noisdopp,'sym4');
% %Reconstruct a smoothed version of the signal using the approximation coefficients. Plot and compare with the original signal.
% xrec = idwt(cA,zeros(size(cA)),'sym4');
% plot(noisdopp)
% hold on
% grid on
% plot(xrec)
% legend('Original','Reconstruction')
% 
% %单尺度分解dtw
%%%clear;
% load('af1522.DAT'); 
% s=af1522(1000:8000);
% subplot(311);plot(s);title('原始信号');
% xlabel('时间');ylabel('幅值');
% [ca1,cd1]=dwt(s,'db5');%db5小波分解
% subplot(3,2,3);plot(ca1);title('db5第一层分解低频信号');
% xlabel('时间');ylabel('幅值');
% subplot(3,2,4);plot(cd1);title('db5第一层分解高频信号');
% xlabel('时间');ylabel('幅值');
% [ca2,cd2]=dwt(s,'haar');%harr小波分解
% subplot(3,2,5);plot(ca2);title('harr第一层分解低频信号');
% xlabel('时间');ylabel('幅值');
% subplot(3,2,6);plot(cd2);title('harr第一层分解高频信号');
% xlabel('时间');ylabel('幅值');
% 
% %多尺度分解wavedec
% clear;
% load('af1522.DAT');
% s=af1522(1000:8000);
% figure;
% subplot(311);plot(s);title('原始信号');
% xlabel('时间');ylabel('幅值');
% [c,l]=wavedec(s,3,'db5');
% % returns the wavelet decomposition of the 1-D signal x at level n using the wavelet wname. The output decomposition structure consists of the wavelet decomposition vector c and the bookkeeping vector l, which contains the number of coefficients by level.
% subplot(312);plot(c);title('信号s的3尺度 小波分解结构');
% xlabel('尺度3的低频系数和尺度3、2和1的高频系数');%小波分解的所有尺度信号
% subplot(313);plot(c);title('信号s的3尺度 小波分解低频系数');
% xlabel('尺度3的低频系数');
% axis([0,1000,-0.1,0.15]);%仅观察分解的一部分信号

% %多尺度分解2.m
% clear;load('af1522.DAT');
% s=af1522(1000:8000);
% figure;
% subplot(8,1,1);plot(s);title('原始信号');
% xlabel('时间');ylabel('幅值');
% [c,l]=wavedec(s,6,'db5');%对信号进行6层小波分解
% w=waverec(c,l,'db5');%waverec:1-D wavelet reconstruction
% ca1=appcoef(c,l,'db5',1);
% cd1=detcoef(c,l,1);
% subplot(8,2,3);plot(ca1);title('第一层低频信号');
% xlabel('时间');ylabel('幅值');
% subplot(8,2,4);plot(cd1);title('第一层高频信号');
% xlabel('时间');ylabel('幅值');
% %wrcoef：小波系数的（单支）重构。
% %appcoef：提取DWT后小波的逼近系数。
% %detcoef：提取DWT后小波的细节系数。
% % A=appcoef(C,L,'wname',N),利用小波'wname'从分解系数[C,L]中提取第N层近似系数
% ca2=appcoef(c,l,'db5',2);
% cd2=detcoef(c,l,2);
% subplot(8,2,5);plot(ca2);title('第二层低频信号');
% xlabel('时间');ylabel('幅值');
% subplot(8,2,6);plot(cd2);title('第二层高频信号');
% xlabel('时间');ylabel('幅值');
% 
% ca3=appcoef(c,l,'db5',3);
% cd3=detcoef(c,l,3);
% subplot(8,2,7);plot(ca3);title('第三层低频信号');
% xlabel('时间');ylabel('幅值');
% subplot(8,2,8);plot(cd3);title('第三层高频信号');
% xlabel('时间');ylabel('幅值');
% 
% ca4=appcoef(c,l,'db5',4);
% cd4=detcoef(c,l,4);
% subplot(8,2,9);plot(ca4);title('第四层低频信号');
% xlabel('时间');ylabel('幅值');
% subplot(8,2,10);plot(cd4);title('第四层高频信号');
% xlabel('时间');ylabel('幅值');
% 
% ca5=appcoef(c,l,'db5',5);
% cd5=detcoef(c,l,5);
% subplot(8,2,11);plot(ca5);title('第五层低频信号');
% xlabel('时间');ylabel('幅值');
% subplot(8,2,12);plot(cd5);title('第五层高频信号');
% xlabel('时间');ylabel('幅值');
% 
% ca6=appcoef(c,l,'db5',6);
% cd6=detcoef(c,l,6);
% subplot(8,2,13);plot(ca6);title('第六层低频信号');
% xlabel('时间');ylabel('幅值');
% subplot(8,2,14);plot(cd6);title('第六层高频信号');
% xlabel('时间');ylabel('幅值');
% 
% a=waverec(c,l,'db5');%waverec:1-D wavelet reconstruction
% subplot(8,1,8);plot(a);title('重构信号');
% xlabel('时间');ylabel('幅值');
% err=norm(s-a);%误差平方和

% 
% %多尺度分解3-为空
% 
% %%小波包分解及重构wpdec
% % s=AF1(2000:4000);没有此数据
% clear;clc;close all;
% load('af1522.DAT');
% s=af1522(1000:8000);
% t=wpdec(s,7,'db5');%Wavelet packet decomposition 1-D
% s0=wprec(t); %Wavelet packet reconstruction 1-D
% %重构40Hz以下的地震波信号
% s50=wprcoef(t,[5,0]); %X=wprcoef（T，N）计算小波包树T的节点N的重构系数。
% %重构312.5～1250之间的信号
% s11=wprcoef(t,[1,1]);
% s21=wprcoef(t,[2,1]);
% %重构234.75～312.5Hz之间的信号
% s44=wprcoef(t,[4,4]);
% %重构195.5～234.75Hz之间的信号
% s56=wprcoef(t,[5,6]);
% e0=s0'*s0;
% e50=s50'*s50;
% e11=s11'*s11;
% e21=s21'*s21;
% e44=s44'*s44;
% e56=s56'*s56;
% a=e50/e0;
% d=(e11+e21+e44+e56)/e0;
% %画在一起对比，几乎无差别
% figure;plot(s);
% hold on;plot(s0);
% legend('Original','Reconstruction')
% %画在上下来表示
% figure;
% subplot(2,1,1);plot(s);title('原始信号');
% hold on;
% subplot(2,1,2);plot(s0);title('重构信号');
% 
% 
% 
% %小波分解重构精简
% % load('F:\work\go.txt');
% % s=go(1000:8000);
% 
% clear;
% load('af1522.DAT');
% s=af1522(1000:8000);
% %使用小波db5对信号进行5层分解
% w='db7';
% [c,l]=wavedec(s,7,w);
% %重建1到5层的近似系数和细节系数
% %重建过程中使用分解得到的数据结构[c,l]
% for i=1:7
%     A(i,:)=wrcoef('a',c,l,w,i);
%     D(i,:)=wrcoef('d',c,l,w,i);
% end
% %请注意这组循环语句调用了10次wrcoef命令来重建小波系数
% %其中5次为近似系数，5次为细节系数
% t=100:900;
% figure;
% subplot(8,2,1);plot(t,s(t),'r');
% title('Orig. signao and approx. 1 to 7.');
% subplot(8,2,2);plot(t,s(t),'r');
% title('Orig. signao and details. 1 to 7.');
% for i=1:7
%    %绘出5幅近似系数图像 
%    %绘出5幅细节系数图像
%    subplot(8,2,2*i+1);plot(t,A(7-i+1,t),'b');
%    subplot(8,2,2*i+2);plot(t,D(7-i+1,t),'g');
% end






%%
%小波时频图.连续小波时频图绘制原理，示例
%https://www.ilovematlab.cn/thread-96706-1-1.html
clear;
clc;
close all;
fs=1024;                          %采样频率
f1=100;
f2=200;
t=0:1/fs:1;
s=sin(2*pi*f1*t)+sin(2*pi*f2*t);  %两个不同频率正弦信号合成的仿真信号， w=2*pi*f
%%%%%%%%%%%%%%%%%小波时频图绘制%%%%%%%%%%%%%%%%%%
wavename='cmor3-3';               %可换小波，morlet小波的带宽参数和中心频率取得越大，时频图上反映的时频聚集性越好
totalscal=256;                    %尺度序列的长度，即scal的长度
wcf=centfrq(wavename);            %小波的中心频率. centfrq该函数能求出以wname命名的母小波的中心频率。
cparam=2*wcf*totalscal;           %为得到合适的尺度所求出的参数
a=totalscal:-1:1;
scal=cparam./a;                   %得到各个尺度，以使转换得到频率序列为等差序列
coefs=cwt(s,scal,wavename);       %得到小波系数. %该函数能实现连续小波变换，其中S为输入信号，SCALES为尺度，wname为小波名称。
f=scal2frq(scal,wavename,1/fs);   %将尺度转换为频率
%F = scal2frq(A,'wname',DELTA);说明：该函数能将尺度转换为实际频率，其中A为尺度，wname为小波名称，DELTA为采样周期。
%尺度与频率之间的关系: Fa=Fc×fs/a ,设a为尺度，fs为采样频率，Fc为小波中心频率，则a对应的实际频率Fa 
figure;
imagesc(t,f,abs(coefs));          %绘制色谱图.使用缩放显示图像。imagesc(x,y,A) 将矩阵A中的元素数值按大小转化为不同颜色，并在坐标轴对应位置处(x,y)以这种颜色染色
%或者选用mesh可以看到立体的图
colorbar;
xlabel('时间 t/s');
ylabel('频率 f/Hz');
title('小波时频图');


%%
% https://blog.csdn.net/cqfdcw/article/details/84995904/
clear all  
clc
fs=1024;  %采样频率
f1=100;   %信号的第一个频率
f2=300;   %信号第二个频率
t=0:1/fs:1;
s=sin(2*pi*f1*t)+sin(2*pi*f2*t);  %生成混合信号
[tt]=wpdec(s,3,'dmey');  %小波包分解，3代表分解3层，'dmey'使用meyr小波
plot(tt)               %画小波包树图，% Plot tree t. % Click the node (3,0), (see the plot function)
wpviewcf(tt,1);        %画出时间频率图。% Plot the colored wavelet packet coefficients.