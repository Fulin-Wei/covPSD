s=AF1(2000:4000);
t=wpdec(s,7,'db5');
s0=wprec(t);
%重构40Hz以下的地震波信号
s50=wprcoef(t,[5,0]);
%重构312.5～1250之间的信号
s11=wprcoef(t,[1,1]);
s21=wprcoef(t,[2,1]);
%重构234.75～312.5Hz之间的信号
s44=wprcoef(t,[4,4]);
%重构195.5～234.75Hz之间的信号
s58=wprcoef(t,[5,8]);
e0=s0'*s0;
e50=s50'*s50;
e11=s11'*s11;
e21=s21'*s21;
e44=s44'*s44;
e58=s58'*s58;
a=e50/e0;
d=(e11+e21+e44+e56)/e0;
subplot(211);plot(s0);title('重构信号')




