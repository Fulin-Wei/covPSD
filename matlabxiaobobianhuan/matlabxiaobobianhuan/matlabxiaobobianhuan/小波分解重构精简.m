load(F:\work\go.txt);
s=go(1000:8000);
%使用小波db5对信号进行5层分解
w='db7';
[c,l]=wavedec(s,5,w);
%重建1到5层的近似系数和细节系数
%重建过程中使用分解得到的数据结构[c,l]
for i=1:7
    A(i,:)=wrcoef('a',c,l,w,i);
    D(i,:)=wrcoef('d',c,l,w,i);
end
%请注意这组循环语句调用了10次wrcoef命令来重建小波系数
%其中5次为近似系数，5次为细节系数
t=100:900;
subplot(8,2,1);plot(t,s(t),'r');
title('Orig. signao and approx. 1 to 7.');
subplot(8,2,2);plot(t,s(t),'r');
title('Orig. signao and details. 1 to 7.');
for i=1:7
   %绘出5幅近似系数图像 
   %绘出5幅细节系数图像
   subplot(8,2,2*i+1);plot(t,A(7-i+1,t),'b');
   subplot(8,2,2*i+2);plot(t,A(7-i+1,t),'g');
end