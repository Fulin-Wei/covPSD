load(F:\work\go.txt);
s=go(1000:8000);
%ʹ��С��db5���źŽ���5��ֽ�
w='db7';
[c,l]=wavedec(s,5,w);
%�ؽ�1��5��Ľ���ϵ����ϸ��ϵ��
%�ؽ�������ʹ�÷ֽ�õ������ݽṹ[c,l]
for i=1:7
    A(i,:)=wrcoef('a',c,l,w,i);
    D(i,:)=wrcoef('d',c,l,w,i);
end
%��ע������ѭ����������10��wrcoef�������ؽ�С��ϵ��
%����5��Ϊ����ϵ����5��Ϊϸ��ϵ��
t=100:900;
subplot(8,2,1);plot(t,s(t),'r');
title('Orig. signao and approx. 1 to 7.');
subplot(8,2,2);plot(t,s(t),'r');
title('Orig. signao and details. 1 to 7.');
for i=1:7
   %���5������ϵ��ͼ�� 
   %���5��ϸ��ϵ��ͼ��
   subplot(8,2,2*i+1);plot(t,A(7-i+1,t),'b');
   subplot(8,2,2*i+2);plot(t,A(7-i+1,t),'g');
end