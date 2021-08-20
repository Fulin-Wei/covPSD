%小波变换，二维图像的
%https://blog.csdn.net/qq_15295565/article/details/87891843
clc;
clear;
close all;
% 装载图像
% load hua;
% X包含载入的图像
% X = imread ('hua_color.jpg');%彩色图不需要上色 colormap
X = imread ('hua_gray.png');
% 绘制原始图像
figure(1);
subplot(2,2,1);
image(X);
% colormap(map); %将当前图窗的颜色图设置为 map 指定的颜色图，map是一个颜色矩阵
title('原始图像');
% 使用sym5对X进行尺度为2的分解
[c,s] = wavedec2(X,1,'sym5');
% 从小波分解结构[c,s]进行尺度为1和2时的低频重构
a1 = wrcoef2('a',c,s,'sym5',1); %wrcoef2 reconstructs the coefficients of an image.
a2 = wrcoef2('a',c,s,'sym5',2); %X = wrcoef2('type',C,S,wname,N) computes the matrix of reconstructed coefficients of level N, based on the wavelet decomposition structure [C,S]

% 绘制尺度为1时的低频图像
subplot(2,2,3);
image(a1);%colormap(map);
title('尺度为1时的低频图像');
% 绘制尺度为2时的低频图像
subplot(2,2,4);
image(a2);%colormap(map);
title('尺度为2时的低频图像');
% 从小波分解结构[c,s]在尺度为2时重构高频
% 'h' 是水平方向
% 'v' 是垂直方向
% 'd' 是对角方向
hd2 = wrcoef2('h',c,s,'sym5',1); 
vd2 = wrcoef2('v',c,s,'sym5',1); 
dd2 = wrcoef2('d',c,s,'sym5',1);
% 绘制高频图像
figure(2);
subplot(2,2,1);
image(hd2);%colormap(map);
title('尺度为2时的水平高频图像');
subplot(2,2,2);
image(vd2);%colormap(map);
title('尺度为2时的垂直高频图像');
subplot(2,2,3);
image(dd2);%colormap(map);
title('尺度为2时的对角高频图像');
subplot(2,2,4);
image(hd2+dd2+vd2+double(a1));%colormap(map);
% 验证这些图像的长度都是sX
sX = size(X)
sa1 = size(a1)
shd2 = size(hd2)
newfig = hd2+dd2+vd2+double(a1)- double(X);
norm(newfig)  %a1,a2和X 都是unit8类型，而其余变量都是double类型