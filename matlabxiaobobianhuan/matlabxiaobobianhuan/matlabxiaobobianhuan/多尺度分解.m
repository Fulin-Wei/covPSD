s=af1522(1000:8000);
subplot(611);plot(s);title('ԭʼ�ź�');
Xlabel('ʱ��');Ylabel('��ֵ');
[c,l]=wavedec(s,3,'db5');
subplot(613);plot(c);title('�ź�s��3�߶� С���ֽ�ṹ');
Xlabel('�߶�3�ĵ�Ƶϵ���ͳ߶�3��2��1�ĸ�Ƶϵ��')��
axis([0,1000,-5,5]);