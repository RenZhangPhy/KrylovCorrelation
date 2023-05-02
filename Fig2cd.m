%%
% Fig 2 c and d
clc;
clear;

fitend = 10;
fitn = 4;

dataC1 = load('Correlation_Ox_site=13_O_loc=6_h=1_g=1.2.txt');
databn1 = load('bn_Ox_site=13_O_loc=6_h=1_g=1.2.txt');

dataC2 = load(['Hubbard_Corr_Ob','_site=14','_J=0.5','_V1=2.1','_V2=0.5','.txt']);
databn2 = load(['Hubbard_bn_Ob','_site=14','_J=0.5','_V1=2.1','_V2=0.5','.txt']);


figure('Position',[900 200 1700 600])

subplot(1,2,1)
hold on
box on

plot(databn1(:,1),databn1(:,2),'MarkerSize',10,'Marker','o','LineWidth',1.5,'LineStyle','none','Color','r')
plot(databn2(:,1),databn2(:,2),'MarkerSize',10,'Marker','s','LineWidth',1.5,'LineStyle','none','Color','b')
p = polyfit(databn1(1:fitend,1),databn1(1:fitend,2),fitn);
derp = polyder(p);
databnfit1 = polyval(p,1:0.1:fitend);
derbn1 = polyval(derp,1)/polyval(p,1);%b'[1]/b[1]
plot(1:0.1:fitend,databnfit1,'LineWidth',2,'LineStyle','-','Color','r')


p = polyfit(databn2(1:fitend,1),databn2(1:fitend,2),fitn);
derp = polyder(p);
databnfit2 = polyval(p,1:0.1:fitend);
derbn2 = polyval(derp,1)/polyval(p,1);%b'[1]/b[1]
plot(1:0.1:fitend,databnfit2,'LineWidth',2,'LineStyle','-','Color','b')

set(gca,'FontSize',40,'LineWidth',2,'xlim',[0,20],'ylim',[0,15])
xlabel('$n$','interpreter','latex','fontsize',60)
ylabel('$b_n$','interpreter','latex','fontsize',60)

fitendarr = 5:20;
num = size(fitendarr);

for i = 1:num(2)

    fitend = fitendarr(i);
    p1 = polyfit(databn1(1:fitend,1),databn1(1:fitend,2),fitn);
    derp1 = polyder(p1);
    derbn1(i) = polyval(derp1,1)/polyval(p1,1);%b'[1]/b[1]
    
    
    p2 = polyfit(databn2(1:fitend,1),databn2(1:fitend,2),fitn);
    derp2 = polyder(p2);
    derbn2(i) = polyval(derp2,1)/polyval(p2,1);%b'[1]/b[1]

end


leg = legend([num2str(mean(derbn1),'%.3f'),'$\pm$',num2str(std(derbn1)/sqrt(num(2)),'%.3f'),',\ $\hat\sigma_0^x$'],...
    [num2str(mean(derbn2),'%.3f'),'$\pm$',num2str(std(derbn2)/sqrt(num(2)),'%.3f'),',\ $2\hat n_0-1$']);
set(leg,'Interpreter','latex','Location','northwest','FontSize',40,'box','off');


subplot(1,2,2)
hold on
box on
plot(dataC1(:,1)*databn1(1,2),dataC1(:,2),'MarkerSize',10,'Marker','o','LineWidth',1,'LineStyle','-','Color','r')
plot(dataC2(:,1)*databn2(1,2),dataC2(:,2),'MarkerSize',10,'Marker','s','LineWidth',1,'LineStyle','-','Color','b')
set(gca,'FontSize',40,'LineWidth',2,'xlim',[0,5])
xlabel('$tb_1$','interpreter','latex','fontsize',60)
ylabel('${\cal C}(t)$','interpreter','latex','fontsize',60)


axes('Position',[0.687058823529412 0.568333333333333 0.207764705882343 0.329047619047625]);
hold on
box on
plot(dataC1(:,1),dataC1(:,2),'MarkerSize',10,'Marker','o','LineWidth',1,'LineStyle','-','Color','r')
plot(dataC2(:,1),dataC2(:,2),'MarkerSize',10,'Marker','s','LineWidth',1,'LineStyle','-','Color','b')
set(gca,'FontSize',40,'LineWidth',2,'xlim',[0,2],'ylim',[0,1])
xlabel('$tJ$','interpreter','latex','fontsize',45)
% ylabel('$C(t)$','interpreter','latex','fontsize',40)



% Create textbox
annotation('textbox',...
    [0.134666666666666 0.25 0.0413333333333334 0.0850000000000001],...
    'String','(c)',...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',60,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','off');

% Create textbox
annotation('textbox',...
    [0.577333333333332 0.25 0.0413333333333342 0.0833333333333338],...
    'String','(d)',...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',60,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','off');

print('Universal_Ising_Hubbard','-depsc')
