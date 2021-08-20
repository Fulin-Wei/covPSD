%求信号功率谱密度用periodogram()函数
%https://blog.csdn.net/chenshiming1995/article/details/109173963
%一个信号的功率密度谱，就是其自相关函数的傅里叶变换。
clear; 
Fs=1000; %采样频率 
n=0:1/Fs:1;  
%产生含有噪声的序列 
xn=cos(2*pi*40*n)+3*cos(2*pi*100*n)+randn(size(n)); 
figure(1);subplot(3,1,1);plot(xn);
 %矩形窗 
 window=boxcar(length(xn));
subplot(3,1,2);plot(window);
 %直接法 
nfft=1024; %DFT点数
[Pxx,f]=periodogram(xn,window,nfft,Fs);
subplot(3,1,3);plot(f,10*log10(Pxx));
%plot(f,10*log10(Pxx));


%%
%解析MATLAB短时傅里叶变换函数spectrogram()
%https://blog.csdn.net/weixin_42765703/article/details/104871604