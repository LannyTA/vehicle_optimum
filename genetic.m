global NIND;%������Ⱥ����ΪNIND����ʼ��Ⱥ40������
NIND=40;
NVAR=5;%����ά��Ϊ4
MAXGEN=80;%����������Ϊ100��
PRECI=50;%�������Ķ�����λ��
GGAP=1;%����Ϊ1����Ⱥ������������
trace=zeros(2,MAXGEN);%�㷨����׷�پ���ĳ�ʼ��
Chrom=crtbp(NIND,PRECI*NVAR);%��Ⱥ�ĳ�ʼ����chrom�ǻ�û�н���ѡ�񣬽��棬�������Ⱥ
FieldD=[PRECI PRECI PRECI PRECI PRECI;2.7 2 1 1 4;5 4 3 1 6.6;1 1 1 1 1;0 0 0 0 0;1 1 1 1 1;1 1 1 1 1];
%��Ⱥ���������е�10 0 0;100 10 10��ʾ���������������޷ֱ�Ϊ[10,100],[0,10],[0,10]������ķֱ�Ϊ3��������[1,0,1,1]��4�����ֱ�Ϊ��1-�����׼�����Ʊ��룬0-�����׼�̶ȣ�1-���ޱ����䣬1-���ޱ�����
gen=0;%��ʼ����Ϊ0
variable=bs2rv(Chrom,FieldD);%���������ö����Ʊ�ʾ����Ⱥת��Ϊ10���ƣ���Ϊ��һ�μ���aimֵ���Ա���
ObjV=optimum([variable(:,1),variable(:,2),variable(:,3),variable(:,4),variable(:,5)]);%�������ɵĳ�ʼ��Ⱥ�õ���aimֵ
while gen<MAXGEN
    FitnV=ranking(ObjV);%��Ӧ������ȡ��Сֵ��ֱ����ObjV,ȡ���ֵ����-ObjV����1/ObjV֮��ļ�����
    SelCh=select('sus',Chrom,FitnV,GGAP);%ѡ������
    SelCh=recombin('xovsp',SelCh,0.7);%��������
    SelCh=mut(SelCh);%��������
    variable=bs2rv(SelCh,FieldD);%������ת����ʮ�����Ա���
    ObjVSel=optimum([variable(:,1),variable(:,2),variable(:,3),variable(:,4),variable(:,5)]);%���㾭��һ�ν���֮���aimֵ��ObjVSelΪ�������aimֵ
    [Chrom, ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);%�ش������㣬
    gen=gen+1;%����������һ
    ObjV(ObjV<0)=inf;
    [Y,I]=min(ObjV);hold on;%�ҳ���������Ⱥ�������Сֵ
    %plot(variable(I),Y,'bo');
    trace(1,gen)=min(ObjV);%���ҳ�����Сֵ�����㷨����׷�پ���
    trace(2,gen)=sum(ObjV)/length(ObjV);%�ҳ�һ����Ⱥ��ƽ��aimֵ�������㷨����׷�پ���
end
variable=bs2rv(Chrom,FieldD);
% figure(1);
% plot(variable(:,1),'o');grid
% hold on;
figure;
% plot(trace(1,:));
% hold on;
% plot(trace(2,:),'-.');grid
% legend('��ı仯','��Ⱥ��ֵ�ı仯')%��aimֵ�ı仯����Ⱥ�ľ�ֵ�仯���ӻ�
plot(trace(1,:));
legend('�Ż�Ŀ�꺯����ı仯');

