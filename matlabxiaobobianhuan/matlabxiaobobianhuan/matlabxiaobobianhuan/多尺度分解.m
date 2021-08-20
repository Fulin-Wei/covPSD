s=af1522(1000:8000);
subplot(611);plot(s);title('原始信号');
Xlabel('时间');Ylabel('幅值');
[c,l]=wavedec(s,3,'db5');
subplot(613);plot(c);title('信号s的3尺度 小波分解结构');
Xlabel('尺度3的低频系数和尺度3、2和1的高频系数')；
axis([0,1000,-5,5]);