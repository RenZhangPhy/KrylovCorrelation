
%%
% Fig 3 a and b
clc;
clear;

figure('Position',[900 200 1700 600])

subplot(1,2,1)
hold on
box on

fitend = 10;
fitn = 4;


databn1 = load('bn_Ox_site=13_O_loc=6_h=1_g=1.2.txt');
databn2 = load('bn_Oyy_site=13_O_loc=6_h=1_g=0.5.txt');
databn3 = load(['Hubbard_bn_Ob','_site=14','_J=0.2','_V1=3','_V2=0.5','.txt']);
databn4 = load(['Hubbard_bn_Ob','_site=14','_J=0.21','_V1=1','_V2=1','.txt']);

dataC1 = load('Corr_Expolate_Ox_h=1_g=1.2.txt');
dataC2 = load('Corr_Expolate_Oyy_h=1_g=0.5.txt');
dataC3 = load(['Hubbard_Corr_Ob','_site=14','_J=0.2','_V1=3','_V2=0.5','.txt']);
dataC4 = load(['Hubbard_Corr_Ob','_site=14','_J=0.21','_V1=1','_V2=1','.txt']);


plot(databn1(:,1),databn1(:,2),'MarkerSize',10,'Marker','o','LineWidth',1,'LineStyle','none','Color','r')
p = polyfit(databn1(1:fitend,1),databn1(1:fitend,2),fitn);
databnfit1 = polyval(p,1:0.1:fitend);


plot(databn2(:,1),databn2(:,2),'MarkerSize',10,'Marker','s','LineWidth',1,'LineStyle','none','Color','b')
p = polyfit(databn2(1:fitend,1),databn2(1:fitend,2),fitn);
databnfit2 = polyval(p,1:0.1:fitend);


plot(databn3(:,1),databn3(:,2),'MarkerSize',10,'Marker','d','LineWidth',1,'LineStyle','none','Color','k')
p = polyfit(databn3(1:fitend,1),databn3(1:fitend,2),fitn);
databnfit3 = polyval(p,1:0.1:fitend);


plot(databn4(:,1),databn4(:,2),'MarkerSize',10,'Marker','^','LineWidth',1,'LineStyle','none','Color','g')
p = polyfit(databn4(1:fitend,1),databn4(1:fitend,2),fitn);
databnfit4 = polyval(p,1:0.1:fitend);

% fit curve

plot(1:0.1:fitend,databnfit1,'LineWidth',2,'LineStyle','-','Color','r')
plot(1:0.1:fitend,databnfit2,'LineWidth',2,'LineStyle','-','Color','b')
plot(1:0.1:fitend,databnfit3,'LineWidth',2,'LineStyle','-','Color','k')
plot(1:0.1:fitend,databnfit4,'LineWidth',2,'LineStyle','-','Color','g')

set(gca,'FontSize',40,'LineWidth',2,'xlim',[0,20],'ylim',[0,20])
xlabel('$n$','interpreter','latex','fontsize',60)
ylabel('$b_n$','interpreter','latex','fontsize',60)



fitn = 4;

fitendarr = 6:15;
num = size(fitendarr);

for i = 1:num(2)

    fitend = fitendarr(i);
    p1 = polyfit(databn1(1:fitend,1),databn1(1:fitend,2),fitn);
    derp1 = polyder(p1);
    derbn1(i) = polyval(derp1,1)/polyval(p1,1);%b'[1]/b[1]
    
    
    p2 = polyfit(databn2(1:fitend,1),databn2(1:fitend,2),fitn);
    derp2 = polyder(p2);
    derbn2(i) = polyval(derp2,1)/polyval(p2,1);%b'[1]/b[1]

    p3 = polyfit(databn3(1:fitend,1),databn3(1:fitend,2),fitn);
    derp3 = polyder(p3);
    derbn3(i) = polyval(derp3,1)/polyval(p3,1);%b'[1]/b[1]

    p4 = polyfit(databn4(1:fitend,1),databn4(1:fitend,2),fitn);
    derp4 = polyder(p4);
    derbn4(i) = polyval(derp4,1)/polyval(p4,1);%b'[1]/b[1]

end


leg = legend([num2str(mean(derbn1),'%.3f'),'$\pm$',num2str(std(derbn1)/sqrt(num(2)),'%.3f'),'$,\sigma_0^x$'],...
    [num2str(mean(derbn2),'%.3f'),'$\pm$',num2str(std(derbn2)/sqrt(num(2)),'%.3f'),'$,\sigma_0^y\sigma_1^y$'],...
    [num2str(mean(derbn3),'%.3f'),'$\pm$',num2str(std(derbn3)/sqrt(num(2)),'%.3f'),'$,2n_0-1$'],...
    [num2str(mean(derbn4),'%.3f'),'$\pm$',num2str(std(derbn4)/sqrt(num(2)),'%.3f'),'$,2n_0-1$']);
set(leg,'Interpreter','latex','Location','northwest','FontSize',40,'box','off');


subplot(1,2,2)
hold on
box on

plot(dataC1(:,1)*databn1(1,2),dataC1(:,2),'MarkerSize',10,'Marker','o','LineWidth',1,'LineStyle','-','Color','r')
plot(dataC2(:,1)*databn2(1,2),dataC2(:,2),'MarkerSize',10,'Marker','s','LineWidth',1,'LineStyle','-','Color','b')
plot(dataC3(:,1)*databn3(1,2),dataC3(:,2),'MarkerSize',10,'Marker','d','LineWidth',1,'LineStyle','-','Color','k')
plot(dataC4(:,1)*databn4(1,2),dataC4(:,2),'MarkerSize',10,'Marker','^','LineWidth',1,'LineStyle','-','Color','g')


set(gca,'FontSize',40,'LineWidth',2,'xlim',[0,5])
xlabel('$tb_1$','interpreter','latex','fontsize',60)
ylabel('${\cal C}(t)$','interpreter','latex','fontsize',60)


% Create textbox
annotation('textbox',...
    [0.41 0.83 0.0413333333333342 0.0833333333333341],...
    'String','(a)',...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',60,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','off');

% Create textbox
annotation('textbox',...
    [0.85 0.83 0.0413333333333334 0.085],...
    'String','(b)',...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',60,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','off');


print('Oscillation','-depsc')

%%
% Fig 3 c and d
clc;
clear;

figure('Position',[900 200 1700 600])

subplot(1,2,1)
hold on
box on

fitend = 10;
fitn = 4;


databn1 = load('bn_Oz_site=13_O_loc=6_h=1_g=0.2.txt');
databn2 = load('bn_Oz_site=13_O_loc=6_h=1_g=0.5.txt');
databn3 = load(['Hubbard_bn_Ob','_site=14','_J=0.2','_V1=5','_V2=0.5','.txt']);
databn4 = load(['Hubbard_bn_Ob','_site=14','_J=0.21','_V1=1','_V2=3.5','.txt']);

dataC1 = load('Corr_Expolate_Oz_h=1_g=0.2.txt');
dataC2 = load('Corr_Expolate_Oz_h=1_g=0.5.txt');
dataC3 = load(['Hubbard_Corr_Ob','_site=14','_J=0.2','_V1=5','_V2=0.5','.txt']);
dataC4 = load(['Hubbard_Corr_Ob','_site=14','_J=0.21','_V1=1','_V2=3.5','.txt']);

plot(databn1(:,1),databn1(:,2),'MarkerSize',10,'Marker','o','LineWidth',1,'LineStyle','none','Color','r')
p = polyfit(databn1(1:fitend,1),databn1(1:fitend,2),fitn);
databnfit1 = polyval(p,1:0.1:fitend);


plot(databn2(:,1),databn2(:,2),'MarkerSize',10,'Marker','s','LineWidth',1,'LineStyle','none','Color','b')
p = polyfit(databn2(1:fitend,1),databn2(1:fitend,2),fitn);
databnfit2 = polyval(p,1:0.1:fitend);


plot(databn3(:,1),databn3(:,2),'MarkerSize',10,'Marker','d','LineWidth',1,'LineStyle','none','Color','k')
p = polyfit(databn3(1:fitend,1),databn3(1:fitend,2),fitn);
databnfit3 = polyval(p,1:0.1:fitend);


plot(databn4(:,1),databn4(:,2),'MarkerSize',10,'Marker','^','LineWidth',1,'LineStyle','none','Color','g')
p = polyfit(databn4(1:fitend,1),databn4(1:fitend,2),fitn);
databnfit4 = polyval(p,1:0.1:fitend);

% fit curve
plot(1:0.1:fitend,databnfit1,'LineWidth',2,'LineStyle','-','Color','r')
plot(1:0.1:fitend,databnfit2,'LineWidth',2,'LineStyle','-','Color','b')
plot(1:0.1:fitend,databnfit3,'LineWidth',2,'LineStyle','-','Color','k')
plot(1:0.1:fitend,databnfit4,'LineWidth',2,'LineStyle','-','Color','g')

set(gca,'FontSize',40,'LineWidth',2,'xlim',[0,20],'ylim',[0,23])
xlabel('$n$','interpreter','latex','fontsize',60)
ylabel('$b_n$','interpreter','latex','fontsize',60)

fitn = 4;

fitendarr = 6:15;
num = size(fitendarr);

for i = 1:num(2)

    fitend = fitendarr(i);
    p1 = polyfit(databn1(1:fitend,1),databn1(1:fitend,2),fitn);
    derp1 = polyder(p1);
    derbn1(i) = polyval(derp1,1)/polyval(p1,1);%b'[1]/b[1]
    
    
    p2 = polyfit(databn2(1:fitend,1),databn2(1:fitend,2),fitn);
    derp2 = polyder(p2);
    derbn2(i) = polyval(derp2,1)/polyval(p2,1);%b'[1]/b[1]

    p3 = polyfit(databn3(1:fitend,1),databn3(1:fitend,2),fitn);
    derp3 = polyder(p3);
    derbn3(i) = polyval(derp3,1)/polyval(p3,1);%b'[1]/b[1]

    p4 = polyfit(databn4(1:fitend,1),databn4(1:fitend,2),fitn);
    derp4 = polyder(p4);
    derbn4(i) = polyval(derp4,1)/polyval(p4,1);%b'[1]/b[1]

end


% leg = legend([num2str(mean(derbn1),'%.3f'),'$\pm$',num2str(std(derbn1)/sqrt(num(2)),'%.3f'),'$,\sigma_0^z$'],...
%     [num2str(mean(derbn2),'%.3f'),'$\pm$',num2str(std(derbn2)/sqrt(num(2)),'%.3f'),'$,\sigma_0^z\sigma_1^z$'],...
%     [num2str(mean(derbn3),'%.3f'),'$\pm$',num2str(std(derbn3)/sqrt(num(2)),'%.3f'),'$,2n_0-1$'],...
%     [num2str(mean(derbn4),'%.3f'),'$\pm$',num2str(std(derbn4)/sqrt(num(2)),'%.3f'),'$,2n_0-1$']);
% set(leg,'Interpreter','latex','Location','northwest','FontSize',35);

leg = legend([num2str(0.5,'%.3f'),'$\pm$',num2str(0,'%.3f'),'$,\sigma_0^z$'],...
    [num2str(mean(derbn2),'%.3f'),'$\pm$',num2str(std(derbn2)/sqrt(num(2)),'%.3f'),'$,\sigma_0^z$'],...
    [num2str(mean(derbn3),'%.3f'),'$\pm$',num2str(std(derbn3)/sqrt(num(2)),'%.3f'),'$,2n_0-1$'],...
    [num2str(mean(derbn4),'%.3f'),'$\pm$',num2str(std(derbn4)/sqrt(num(2)),'%.3f'),'$,2n_0-1$']);
set(leg,'Interpreter','latex','Location','northwest','FontSize',40,'box','off');


subplot(1,2,2)
hold on
box on
plot(dataC1(:,1)*databn1(1,2),dataC1(:,2),'MarkerSize',10,'Marker','o','LineWidth',1,'LineStyle','-','Color','r')
plot(dataC2(:,1)*databn2(1,2),dataC2(:,2),'MarkerSize',10,'Marker','s','LineWidth',1,'LineStyle','-','Color','b')
plot(dataC3(:,1)*databn3(1,2),dataC3(:,2),'MarkerSize',10,'Marker','d','LineWidth',1,'LineStyle','-','Color','k')
plot(dataC4(:,1)*databn4(1,2),dataC4(:,2),'MarkerSize',10,'Marker','^','LineWidth',1,'LineStyle','-','Color','g')
set(gca,'FontSize',40,'LineWidth',2,'xlim',[0,5])
xlabel('$tb_1$','interpreter','latex','fontsize',60)
ylabel('${\cal C}(t)$','interpreter','latex','fontsize',60)

% Create textbox
annotation('textbox',...
    [0.41 0.83 0.0413333333333342 0.0833333333333341],...
    'String','(c)',...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',60,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','off');

% Create textbox
annotation('textbox',...
    [0.85 0.83 0.0413333333333334 0.085],...
    'String','(d)',...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',60,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','off');

print('Non-Oscillation','-depsc')
