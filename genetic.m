global NIND;%定义种群数量为NIND，初始种群40个个体
NIND=40;
NVAR=5;%变量维数为4
MAXGEN=80;%最大进化代数为100代
PRECI=50;%基因编码的二进制位数
GGAP=1;%代沟为1，种群个体总数不变
trace=zeros(2,MAXGEN);%算法性能追踪矩阵的初始化
Chrom=crtbp(NIND,PRECI*NVAR);%种群的初始化，chrom是还没有进行选择，交叉，变异的种群
FieldD=[PRECI PRECI PRECI PRECI PRECI;2.7 2 1 1 4;5 4 3 1 6.6;1 1 1 1 1;0 0 0 0 0;1 1 1 1 1;1 1 1 1 1];
%种群进化域，其中的10 0 0;100 10 10表示三个变量的上下限分别为[10,100],[0,10],[0,10]，后面的分别为3个变量的[1,0,1,1]，4个数分别为：1-代表标准二进制编码，0-代表标准刻度，1-下限闭区间，1-上限闭区间
gen=0;%初始代数为0
variable=bs2rv(Chrom,FieldD);%计算域内用二进制表示的种群转换为10进制，作为第一次计算aim值的自变量
ObjV=optimum([variable(:,1),variable(:,2),variable(:,3),variable(:,4),variable(:,5)]);%计算生成的初始种群得到的aim值
while gen<MAXGEN
    FitnV=ranking(ObjV);%适应度排序，取最小值则直接用ObjV,取最大值则用-ObjV或者1/ObjV之类的减函数
    SelCh=select('sus',Chrom,FitnV,GGAP);%选择运算
    SelCh=recombin('xovsp',SelCh,0.7);%交叉运算
    SelCh=mut(SelCh);%变异运算
    variable=bs2rv(SelCh,FieldD);%二进制转换成十进制自变量
    ObjVSel=optimum([variable(:,1),variable(:,2),variable(:,3),variable(:,4),variable(:,5)]);%计算经过一次进化之后的aim值，ObjVSel为进化后的aim值
    [Chrom, ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);%重带入运算，
    gen=gen+1;%进化代数加一
    ObjV(ObjV<0)=inf;
    [Y,I]=min(ObjV);hold on;%找出进化后种群里面的最小值
    %plot(variable(I),Y,'bo');
    trace(1,gen)=min(ObjV);%将找出的最小值放入算法性能追踪矩阵
    trace(2,gen)=sum(ObjV)/length(ObjV);%找出一个种群的平均aim值，放入算法性能追踪矩阵
end
variable=bs2rv(Chrom,FieldD);
% figure(1);
% plot(variable(:,1),'o');grid
% hold on;
figure;
% plot(trace(1,:));
% hold on;
% plot(trace(2,:),'-.');grid
% legend('解的变化','种群均值的变化')%将aim值的变化和种群的均值变化可视化
plot(trace(1,:));
legend('优化目标函数解的变化');

