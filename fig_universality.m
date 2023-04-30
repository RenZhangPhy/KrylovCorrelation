%%
% Fig 1 a and b
clear

ti = 0;
tf = 10;

dataC1 = load('Universality_0p1_of_autocorrelation.txt');
dataC2 = load('Universality_0p25_of_autocorrelation.txt');
dataC3 = load('Universality_0p66_of_autocorrelation.txt');
dataC4 = load('Universality_0p9_of_autocorrelation.txt');
dataC5 = load('Universality_0p5_of_autocorrelation.txt');

figure('Position',[900 200 1000 800]);
hold on
box on

plot(dataC1(:,1),dataC1(:,2),'r-','linewidth',3)
plot(dataC2(:,1),dataC2(:,4),'b-','linewidth',3)
plot(dataC5(:,1),dataC5(:,4),'m-','linewidth',3)
plot(dataC3(:,1),dataC3(:,4),'k-','linewidth',3)
plot(dataC4(:,1),dataC4(:,3),'g-','linewidth',3)

set(gca,'FontSize',50,'LineWidth',2,'xlim',[ti,5])
xlabel('$tb_1$','interpreter','latex','fontsize',70)
ylabel('${\cal C}(t)$','interpreter','latex','fontsize',70)
yticks(0:0.2:1)


axes('Position',[0.48 0.4975 0.4 0.4]);
hold on
box on

plot(dataC1(:,1)/(1 + 1/9),dataC1(:,2),'r-','linewidth',3)
plot(dataC2(:,1)/sqrt(2),dataC2(:,3),'b-','linewidth',3)
plot(dataC5(:,1)/(3^(1/4)),dataC5(:,3),'m-','linewidth',3)
plot(dataC3(:,1)/sqrt(3),dataC3(:,5),'k-','linewidth',3)
plot(dataC4(:,1),dataC4(:,4),'g-','linewidth',3)


set(gca,'FontSize',40,'LineWidth',2,'xlim',[ti,tf/2])
xlabel('$t\alpha$','interpreter','latex','fontsize',60)
xticks(0:5)

% Create line
annotation('line',[0.561 0.561],[0.5 0.8925],...
    'Color',[0.650980392156863 0.650980392156863 0.650980392156863],...
    'LineWidth',3,...
    'LineStyle','--');


% Create line
annotation('line',[0.306 0.306],[0.1865 0.9175],...
    'Color',[0.650980392156863 0.650980392156863 0.650980392156863],...
    'LineWidth',3,...
    'LineStyle','--');

% Create textbox
annotation('textbox',[0.233 0.8315 0.0829999999999999 0.0875],...
    'String','(b)',...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',70,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','off');

print('Ct_all','-depsc')


% figure('Position',[900 200 1000 800]);
% hold on
% box on
% 
% plot(dataC1(:,1)/(1 + 1/9),dataC1(:,2),'r-','linewidth',3)
% plot(dataC2(:,1)/sqrt(2),dataC2(:,3),'b-','linewidth',3)
% plot(dataC5(:,1)/(3^(1/4)),dataC5(:,3),'m-','linewidth',3)
% plot(dataC3(:,1)/sqrt(3),dataC3(:,5),'k-','linewidth',3)
% plot(dataC4(:,1),dataC4(:,4),'g-','linewidth',3)
% 
% 
% set(gca,'FontSize',40,'LineWidth',2,'xlim',[ti,tf/2])
% xlabel('$t\alpha$','interpreter','latex','fontsize',60)
% ylabel('$C(t)$','interpreter','latex','fontsize',60)
% xticks(0:5)
% 
% % Create line
% annotation('line',[0.306 0.306],[0.1865 0.9175],...
%     'Color',[0.650980392156863 0.650980392156863 0.650980392156863],...
%     'LineWidth',3,...
%     'LineStyle','--');



figure('Position',[900 200 1000 800]);
hold on
box on

dim = 10;

plot(1:dim,1 + (1:dim)/9,'r-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,(1+(1:dim)).^(1/2),'b-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,(1+2*(1:dim).^3).^(1/4),'m-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,sqrt(1 + 2*(1:dim).^2),'k-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,(1:dim).^(9/10),'g-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')


set(gca,'FontSize',50,'LineWidth',2)
xlabel('$n$','interpreter','latex','fontsize',70)
ylabel('$b_n/\alpha$','interpreter','latex','fontsize',70)

leg = legend('$1/10;1+n/9$','$1/4;\sqrt{1+n}$','$1/2;(1+2n^3)^{1/4}$','$2/3;\sqrt{1+2n^2}$','$9/10;n^{9/10}$');
set(leg,'location','northwest','Interpreter','latex','FontSize',50,'box','off');


% Create textbox
annotation('textbox',[0.815 0.82775 0.083 0.0875],'String',{'(a)'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',70,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','off');

print('bn_allnew','-depsc')



%%
% Fig 1 c and d
clear;

ti = 0;
tf = 10;

dataC = load('Universality_0p1_of_autocorrelation.txt');

figure('Position',[900 200 1000 800]);
hold on
box on

plot(dataC(:,1),dataC(:,2),'r-','linewidth',3)
plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
plot(dataC(:,1),dataC(:,4),'k-','linewidth',3)
plot(dataC(:,1),dataC(:,5),'g-','linewidth',3)
plot(dataC(:,1),dataC(:,6),'m-','linewidth',3)


set(gca,'FontSize',50,'LineWidth',2,'xlim',[ti,5])
xlabel('$tb_1$','interpreter','latex','fontsize',70)
ylabel('${\cal C}(t)$','interpreter','latex','fontsize',70)
yticks(-0.2:0.2:1)

annotation('textbox',...
    [0.2 0.15 0.3 0.2],...
    'String',{'$\frac{b''[1]}{b[1]}=\frac{1}{10}$'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',70,...
    'FontName','Helvetica Neue');


axes('Position',[0.447 0.4575 0.451 0.44625]);
hold on
box on

plot(dataC(:,1)/(1 + 1/9),dataC(:,2),'r-','linewidth',3)
plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
plot(dataC(:,1)/2,dataC(:,4),'k-','linewidth',3)
plot(dataC(:,1)/sqrt(2),dataC(:,5),'g-','linewidth',3)
plot(dataC(:,1)/((1 + 1/9)^(2)),dataC(:,6),'m-','linewidth',3)


set(gca,'FontSize',40,'LineWidth',2,'xlim',[0,5])
xlabel('$t\alpha$','interpreter','latex','fontsize',60)
xticks(0:5)

% Create line
annotation('line',[0.537 0.536],[0.4625 0.895],...
    'Color',[0.650980392156863 0.650980392156863 0.650980392156863],...
    'LineWidth',3,...
    'LineStyle','--');

% Create line
annotation('line',[0.313 0.313],[0.1865 0.9175],...
    'Color',[0.650980392156863 0.650980392156863 0.650980392156863],...
    'LineWidth',3,...
    'LineStyle','--');

% Create textbox
annotation('textbox',[0.233 0.8315 0.0829999999999999 0.0875],...
    'String','(d)',...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',70,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','off');

print('Ct_0p1','-depsc')



% figure('Position',[900 200 1000 800]);
% hold on
% box on
% plot(dataC(:,1)/(1 + 1/9),dataC(:,2),'r-','linewidth',3)
% plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
% plot(dataC(:,1)/2,dataC(:,4),'k-','linewidth',3)
% plot(dataC(:,1)/sqrt(2),dataC(:,5),'g-','linewidth',3)
% plot(dataC(:,1)/((1 + 1/9)^(2)),dataC(:,6),'m-','linewidth',3)
% 
% set(gca,'FontSize',40,'LineWidth',2,'xlim',[ti,5])
% xlabel('$t\alpha$','interpreter','latex','fontsize',60)
% ylabel('$C(t)$','interpreter','latex','fontsize',50)


figure('Position',[900 200 1000 800]);
hold on
box on

dim = 10;

plot(1:dim,1 + (1:dim)/9,'r-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,(1:dim).^(1/10),'b-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,1 + (1:dim).^(1/5),'k-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,sqrt(1 + (1:dim).^(2/5)),'g-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,(1 + sqrt(1:dim)/9).^(2),'m-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')

leg = legend('$1+n/9$','$n^{1/10}$','$1+n^{1/5}$','$\sqrt{1+n^{2/5}}$','$(1+\sqrt{n}/9)^{2}$');
set(leg,'Location','northwest','Interpreter','latex','FontSize',50,'box','off');

set(gca,'FontSize',50,'LineWidth',2,'ylim',[0.8 5])
xlabel('$n$','interpreter','latex','fontsize',70)
ylabel('$b_n/\alpha$','interpreter','latex','fontsize',70)


% Create textbox
annotation('textbox',[0.815 0.82775 0.083 0.0875],'String',{'(c)'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',70,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','off');

print('bn_0p1','-depsc')


%%
% Fig 1 e and f
clear;

dataC = load('Universality_0p66_of_autocorrelation.txt');

figure('Position',[900 200 1000 800]);
hold on
box on

plot(dataC(:,1),dataC(:,2),'r-','linewidth',3)
plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
plot(dataC(:,1),dataC(:,4),'k-','linewidth',3)
plot(dataC(:,1),dataC(:,5),'g-','linewidth',3)
plot(dataC(:,1),dataC(:,6),'m-','linewidth',3)


set(gca,'FontSize',50,'LineWidth',2,'xlim',[0,5],'ylim',[0,1])
xlabel('$tb_1$','interpreter','latex','fontsize',70)
ylabel('${\cal C}(t)$','interpreter','latex','fontsize',70)
yticks(0:0.2:1)

annotation('textbox',...
    [0.2 0.15 0.3 0.2],...
    'String',{'$\frac{b''[1]}{b[1]}=\frac{2}{3}$'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',70,...
    'FontName','Helvetica Neue');

axes('Position',[0.447 0.4575 0.451 0.44625]);
hold on
box on

plot(dataC(1:100,1)/3,dataC(1:100,2),'r-','linewidth',3)
plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
plot(dataC(:,1)/sqrt(3),dataC(:,4),'k-','linewidth',3)
plot(dataC(1:80,1)/9,dataC(1:80,5),'g-','linewidth',3)
plot(dataC(1:100,1)/6,dataC(1:100,6),'m-','linewidth',3)


set(gca,'FontSize',40,'LineWidth',2,'xlim',[0,5])
xlabel('$t\alpha$','interpreter','latex','fontsize',60)
xticks(0:5)

% Create line
annotation('line',[0.537 0.536],[0.4625 0.895],...
    'Color',[0.650980392156863 0.650980392156863 0.650980392156863],...
    'LineWidth',3,...
    'LineStyle','--');

% Create line
annotation('line',[0.306 0.306],[0.1865 0.9175],...
    'Color',[0.650980392156863 0.650980392156863 0.650980392156863],...
    'LineWidth',3,...
    'LineStyle','--');

% Create textbox
annotation('textbox',[0.233 0.8315 0.0829999999999999 0.0875],...
    'String','(f)',...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',70,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','off');

print('Ct_0p66','-depsc')


% figure('Position',[900 200 1000 800]);
% hold on
% box on
% plot(dataC(1:100,1)/3,dataC(1:100,2),'r-','linewidth',3)
% plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
% plot(dataC(:,1)/sqrt(3),dataC(:,4),'k-','linewidth',3)
% plot(dataC(1:80,1)/9,dataC(1:80,5),'g-','linewidth',3)
% plot(dataC(1:100,1)/6,dataC(1:100,6),'m-','linewidth',3)
% 
% 
% set(gca,'FontSize',40,'LineWidth',2,'xlim',[0,5],'ylim',[0,1])
% xlabel('$t\alpha$','interpreter','latex','fontsize',60)
% ylabel('$C(t)$','interpreter','latex','fontsize',60)


figure('Position',[900 200 1000 800]);
hold on
box on

dim = 10;

plot(1:dim,1 + 2*(1:dim),'r-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,(1:dim).^(2/3),'b-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,sqrt(1 + 2*(1:dim).^2),'k-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,(1 + 2*sqrt(1:dim)).^2,'g-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,1 + 3*(1:dim).^(2/3) + 2*(1:dim),'m-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')


set(gca,'FontSize',50,'LineWidth',2)
xlabel('$n$','interpreter','latex','fontsize',70)
ylabel('$b_n/\alpha$','interpreter','latex','fontsize',70)

leg = legend('$1+2n$','$n^{2/3}$','$\sqrt{1+2n^2}$','$(1+2\sqrt{n})^{2}$',...
    '$1+3n^{2/3}+2n$');
set(leg,'location','northwest','Interpreter','latex','FontSize',50,'box','off');


% Create textbox
annotation('textbox',[0.815 0.82775 0.083 0.0875],'String',{'(e)'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',70,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','off');

print('bn_0p66','-depsc')
%%
clear;

dataC = load('Universality_0p2_of_autocorrelation.txt');

figure('Position',[900 200 1000 800]);
hold on
box on

plot(dataC(:,1),dataC(:,2),'r-','linewidth',3)
plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
plot(dataC(:,1),dataC(:,4),'k-','linewidth',3)
plot(dataC(:,1),dataC(:,5),'g-','linewidth',3)
plot(dataC(:,1),dataC(:,6),'m-','linewidth',3)


set(gca,'FontSize',50,'LineWidth',2,'xlim',[0,5])
xlabel('$tb_1$','interpreter','latex','fontsize',60)
ylabel('$C(t)$','interpreter','latex','fontsize',50)
yticks(-0.2:0.2:1)

annotation('textbox',...
    [0.165 0.190561412811279 0.184 0.127188587188721],...
    'String',{'$\frac{b''(1)}{b(1)}=\frac{1}{5}$'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',60,...
    'FontName','Helvetica Neue');


axes('Position',[0.447 0.4575 0.451 0.44625]);
hold on
box on

plot(dataC(:,1)/(1 + 1/4),dataC(:,2),'r-','linewidth',3)
plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
plot(dataC(:,1)/2,dataC(:,4),'k-','linewidth',3)
plot(dataC(:,1)/sqrt(1 + 3/2),dataC(:,5),'g-','linewidth',3)
plot(dataC(:,1)/(2^(1/5)),dataC(:,6),'m-','linewidth',3)


set(gca,'FontSize',40,'LineWidth',2,'xlim',[0,5])
xlabel('$t\alpha$','interpreter','latex','fontsize',60)
xticks(0:5)

% Create line
annotation('line',[0.537 0.536],[0.4625 0.895],...
    'Color',[0.650980392156863 0.650980392156863 0.650980392156863],...
    'LineWidth',3,...
    'LineStyle','--');

% Create line
annotation('line',[0.313 0.313],[0.1865 0.9175],...
    'Color',[0.650980392156863 0.650980392156863 0.650980392156863],...
    'LineWidth',3,...
    'LineStyle','--');

% Create textbox
annotation('textbox',[0.282 0.8165 0.083 0.0875],...
    'String','(b)',...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',50,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','off');

print('Ct_0p2','-depsc')



figure('Position',[900 200 1000 800]);
hold on
box on
plot(dataC(:,1)/(1 + 1/4),dataC(:,2),'r-','linewidth',3)
plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
plot(dataC(:,1)/2,dataC(:,4),'k-','linewidth',3)
plot(dataC(:,1)/sqrt(1 + 3/2),dataC(:,5),'g-','linewidth',3)
plot(dataC(:,1)/(2^(1/5)),dataC(:,6),'m-','linewidth',3)

set(gca,'FontSize',40,'LineWidth',2,'xlim',[0,5])
xlabel('$t\alpha$','interpreter','latex','fontsize',60)
ylabel('$C(t)$','interpreter','latex','fontsize',50)


figure('Position',[900 200 1000 800]);
hold on
box on

dim = 10;

plot(1:dim,1 + (1:dim)/4,'r-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,(1:dim).^(1/5),'b-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,1 + (1:dim).^(2/5),'k-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,sqrt(1 + 3/2*(1:dim).^(2/3)),'g-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,(1 + (1:dim).^2).^(1/5),'m-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')

leg = legend('$1+n/4$','$n^{1/5}$','$1+n^{2/5}$','$\sqrt{1+3n^{2/3}/2}$','$(1+n^{2})^{1/5}$');
set(leg,'Location','northwest',...
    'Interpreter','latex','FontSize',40);

set(gca,'FontSize',50,'LineWidth',2,'ylim',[0 10])
xlabel('$n$','interpreter','latex','fontsize',60)
ylabel('$b_n/\alpha$','interpreter','latex','fontsize',60)


% Create textbox
annotation('textbox',[0.815 0.82775 0.083 0.0875],'String',{'(a)'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',50,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','off');

print('bn_0p2','-depsc')

%%
clear;

dataC = load('Universality_0p25_of_autocorrelation.txt');

figure('Position',[900 200 1000 800]);
hold on
box on

plot(dataC(:,1),dataC(:,2),'r-','linewidth',3)
plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
plot(dataC(:,1),dataC(:,4),'k-','linewidth',3)
plot(dataC(:,1),dataC(:,5),'g-','linewidth',3)
plot(dataC(:,1),dataC(:,6),'m-','linewidth',3)


set(gca,'FontSize',50,'LineWidth',2,'xlim',[0,5])
xlabel('$tb_1$','interpreter','latex','fontsize',60)
ylabel('$C(t)$','interpreter','latex','fontsize',50)
yticks(-0.2:0.2:1)

annotation('textbox',...
    [0.165 0.190561412811279 0.184 0.127188587188721],...
    'String',{'$\frac{b''(1)}{b(1)}=\frac{1}{4}$'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',60,...
    'FontName','Helvetica Neue');


axes('Position',[0.447 0.4575 0.451 0.44625]);
hold on
box on

plot(dataC(:,1)/(1 + 1/3),dataC(:,2),'r-','linewidth',3)
plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
plot(dataC(:,1)/sqrt(2),dataC(:,4),'k-','linewidth',3)
plot(dataC(:,1)/sqrt(1 + 1/3),dataC(:,5),'g-','linewidth',3)
plot(dataC(:,1)/2,dataC(:,6),'m-','linewidth',3)


set(gca,'FontSize',40,'LineWidth',2,'xlim',[0,5])
xlabel('$t\alpha$','interpreter','latex','fontsize',60)
xticks(0:5)

% Create line
annotation('line',[0.537 0.536],[0.4625 0.895],...
    'Color',[0.650980392156863 0.650980392156863 0.650980392156863],...
    'LineWidth',3,...
    'LineStyle','--');

% Create line
annotation('line',[0.313 0.313],[0.1865 0.9175],...
    'Color',[0.650980392156863 0.650980392156863 0.650980392156863],...
    'LineWidth',3,...
    'LineStyle','--');

% Create textbox
annotation('textbox',[0.233 0.8315 0.0829999999999999 0.0875],...
    'String','(d)',...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',50,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','off');

print('Ct_0p25','-depsc')



figure('Position',[900 200 1000 800]);
hold on
box on
plot(dataC(:,1)/(1 + 1/3),dataC(:,2),'r-','linewidth',3)
plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
plot(dataC(:,1)/sqrt(2),dataC(:,4),'k-','linewidth',3)
plot(dataC(:,1)/sqrt(1 + 1/3),dataC(:,5),'g-','linewidth',3)
plot(dataC(:,1)/2,dataC(:,6),'m-','linewidth',3)

set(gca,'FontSize',40,'LineWidth',2,'xlim',[0,5])
xlabel('$t\alpha$','interpreter','latex','fontsize',60)
ylabel('$C(t)$','interpreter','latex','fontsize',50)


figure('Position',[900 200 1000 800]);
hold on
box on

dim = 10;

plot(1:dim,1 + (1:dim)/3,'r-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,(1:dim).^(1/4),'b-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,sqrt(1 + (1:dim)),'k-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,sqrt(1 + (1:dim).^2/3),'g-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,1 + 2*(1:dim).^(1/4)/3 + (1:dim)/3,'m-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')

leg = legend('$1+n/3$','$n^{1/4}$','$\sqrt{1+n}$','$\sqrt{1+n^2/3}$','$1+2n^{1/4}/3+n/3$');
set(leg,'Location','northwest',...
    'Interpreter','latex','FontSize',40);

set(gca,'FontSize',50,'LineWidth',2,'ylim',[0 10])
xlabel('$n$','interpreter','latex','fontsize',60)
ylabel('$b_n/\alpha$','interpreter','latex','fontsize',60)


% Create textbox
annotation('textbox',[0.815 0.82775 0.083 0.0875],'String',{'(c)'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',50,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','off');

print('bn_0p25','-depsc')


%%
clear;

dataC = load('Universality_0p5_of_autocorrelation.txt');

figure('Position',[900 200 1000 800]);
hold on
box on

plot(dataC(:,1),dataC(:,2),'r-','linewidth',3)
plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
plot(dataC(:,1),dataC(:,4),'k-','linewidth',3)
plot(dataC(:,1),dataC(:,5),'g-','linewidth',3)
plot(dataC(:,1),dataC(:,6),'m-','linewidth',3)


set(gca,'FontSize',40,'LineWidth',2,'xlim',[0,5])
xlabel('$tb_1$','interpreter','latex','fontsize',50)
ylabel('$C(t)$','interpreter','latex','fontsize',40)


axes('Position',[0.447 0.4575 0.451 0.44625]);
hold on
box on

plot(dataC(:,1)/(2),dataC(:,2),'r-','linewidth',3)
plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
plot(dataC(:,1)/3^(3/4),dataC(:,4),'k-','linewidth',3)
plot(dataC(:,1)/3^(1/4),dataC(:,5),'g-','linewidth',3)
plot(dataC(:,1)/3,dataC(:,6),'m-','linewidth',3)


set(gca,'FontSize',40,'LineWidth',2,'xlim',[0,5])
xlabel('$t\alpha$','interpreter','latex','fontsize',60)
xticks(0:5)

% Create line
annotation('line',[0.537 0.536],[0.4625 0.895],...
    'Color',[0.650980392156863 0.650980392156863 0.650980392156863],...
    'LineWidth',3,...
    'LineStyle','--');

% Create line
annotation('line',[0.313 0.313],[0.1865 0.9175],...
    'Color',[0.650980392156863 0.650980392156863 0.650980392156863],...
    'LineWidth',3,...
    'LineStyle','--');


annotation('textbox',...
    [0.165 0.190561412811279 0.184 0.127188587188721],...
    'String',{'$\frac{b''(1)}{b(1)}=\frac{1}{2}$'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',60,...
    'FontName','Helvetica Neue');

print('Ct_0p5','-depsc')


figure('Position',[900 200 1000 800]);
hold on
box on

plot(dataC(:,1)/(2),dataC(:,2),'r-','linewidth',3)
plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
plot(dataC(:,1)/3^(3/4),dataC(:,4),'k-','linewidth',3)
plot(dataC(:,1)/3^(1/4),dataC(:,5),'g-','linewidth',3)
plot(dataC(:,1)/3,dataC(:,6),'m-','linewidth',3)

set(gca,'FontSize',40,'LineWidth',2,'xlim',[0,5])
xlabel('$t\alpha$','interpreter','latex','fontsize',60)
ylabel('$C(t)$','interpreter','latex','fontsize',50)



figure('Position',[900 200 1000 800]);
hold on
box on

dim = 10;

plot(1:dim,1 + (1:dim),'r-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,(1:dim).^(1/2),'b-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,(1 + 2*(1:dim)).^(3/4),'y-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,(1 + 2*(1:dim).^3).^(1/4),'g-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,1 + sqrt(1:dim) + (1:dim),'m-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')


leg = legend('$1+n$','$n^{1/2}$','$(1+2n)^{3/4}$','$(1+2n^{3})^{1/4}$','$1+\sqrt{n}+n$');
set(leg,'Location','northwest',...
    'Interpreter','latex','FontSize',40);

set(gca,'FontSize',40,'LineWidth',2)
xlabel('$n$','interpreter','latex','fontsize',50)
ylabel('$b_n$','interpreter','latex','fontsize',40)

print('bn_0p5','-depsc')

%%

clear;

dataC = load('Universality_0p6_of_autocorrelation.txt');

figure('Position',[900 200 1000 800]);
hold on
box on

plot(dataC(:,1),dataC(:,2),'r-','linewidth',3)
plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
plot(dataC(:,1),dataC(:,4),'k-','linewidth',3)
plot(dataC(:,1),dataC(:,5),'g-','linewidth',3)
plot(dataC(:,1),dataC(:,6),'m-','linewidth',3)


set(gca,'FontSize',50,'LineWidth',2,'xlim',[0,5])
xlabel('$tb_1$','interpreter','latex','fontsize',60)
ylabel('$C(t)$','interpreter','latex','fontsize',50)
yticks(-0.2:0.2:1)

annotation('textbox',...
    [0.165 0.190561412811279 0.184 0.127188587188721],...
    'String',{'$\frac{b''(1)}{b(1)}=\frac{3}{5}$'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',60,...
    'FontName','Helvetica Neue');


axes('Position',[0.447 0.4575 0.451 0.44625]);
hold on
box on

plot(dataC(1:100,1)/(1 + 3/2),dataC(1:100,2),'r-','linewidth',3)
plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
plot(dataC(:,1)/3,dataC(:,4),'k-','linewidth',3)
plot(dataC(:,1)/sqrt(1 + 3/2),dataC(:,5),'g-','linewidth',3)
plot(dataC(:,1)/(5^(3/4)),dataC(:,6),'m-','linewidth',3)


set(gca,'FontSize',40,'LineWidth',2,'xlim',[0,5])
xlabel('$t\alpha$','interpreter','latex','fontsize',60)
xticks(0:5)

% Create line
annotation('line',[0.537 0.536],[0.4625 0.895],...
    'Color',[0.650980392156863 0.650980392156863 0.650980392156863],...
    'LineWidth',3,...
    'LineStyle','--');

% Create line
annotation('line',[0.313 0.313],[0.1865 0.9175],...
    'Color',[0.650980392156863 0.650980392156863 0.650980392156863],...
    'LineWidth',3,...
    'LineStyle','--');

% Create textbox
annotation('textbox',[0.282 0.8165 0.083 0.0875],...
    'String','(b)',...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',50,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','off');

print('Ct_0p6','-depsc')

figure('Position',[900 200 1000 800]);
hold on
box on
plot(dataC(1:100,1)/(1 + 3/2),dataC(1:100,2),'r-','linewidth',3)
plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
plot(dataC(:,1)/3,dataC(:,4),'k-','linewidth',3)
plot(dataC(:,1)/sqrt(1 + 3/2),dataC(:,5),'g-','linewidth',3)
plot(dataC(:,1)/(5^(3/4)),dataC(:,6),'m-','linewidth',3)

set(gca,'FontSize',40,'LineWidth',2,'xlim',[0,5])
xlabel('$t\alpha$','interpreter','latex','fontsize',60)
ylabel('$C(t)$','interpreter','latex','fontsize',50)


figure('Position',[900 200 1000 800]);
hold on
box on

dim = 10;

plot(1:dim,1 + 3*(1:dim)/2,'r-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,(1:dim).^(3/5),'b-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,1 + 2*(1:dim).^(9/10),'k-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,sqrt(1 + 3/2*(1:dim).^2),'g-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,(1 + 4*(1:dim)).^(3/4),'m-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')

leg = legend('$1+3n/2$','$n^{3/5}$','$1+2n^{9/10}$','$(1+3/2n^{2})^{1/2}$','$(1+4n)^{3/4}$');
set(leg,'Location','northwest',...
    'Interpreter','latex','FontSize',40);

set(gca,'FontSize',50,'LineWidth',2,'ylim',[0 20])
xlabel('$n$','interpreter','latex','fontsize',60)
ylabel('$b_n/\alpha$','interpreter','latex','fontsize',60)


% Create textbox
annotation('textbox',[0.815 0.82775 0.083 0.0875],'String',{'(a)'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',50,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','off');

print('bn_0p6','-depsc')

%%

clear;

dataC = load('Universality_0p66_of_autocorrelation.txt');

figure('Position',[900 200 1000 800]);
hold on
box on

plot(dataC(:,1),dataC(:,2),'r-','linewidth',3)
plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
plot(dataC(:,1),dataC(:,4),'k-','linewidth',3)
plot(dataC(:,1),dataC(:,5),'g-','linewidth',3)
plot(dataC(:,1),dataC(:,6),'m-','linewidth',3)


set(gca,'FontSize',50,'LineWidth',2,'xlim',[0,5],'ylim',[0,1])
xlabel('$tb_1$','interpreter','latex','fontsize',60)
ylabel('$C(t)$','interpreter','latex','fontsize',60)
yticks(0:0.2:1)

annotation('textbox',...
    [0.165 0.190561412811279 0.184 0.127188587188721],...
    'String',{'$\frac{b''[1]}{b[1]}=\frac{2}{3}$'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',60,...
    'FontName','Helvetica Neue');

axes('Position',[0.447 0.4575 0.451 0.44625]);
hold on
box on

plot(dataC(1:100,1)/3,dataC(1:100,2),'r-','linewidth',3)
plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
plot(dataC(:,1)/sqrt(3),dataC(:,4),'k-','linewidth',3)
plot(dataC(1:80,1)/9,dataC(1:80,5),'g-','linewidth',3)
plot(dataC(1:100,1)/6,dataC(1:100,6),'m-','linewidth',3)


set(gca,'FontSize',40,'LineWidth',2,'xlim',[0,5])
xlabel('$t\alpha$','interpreter','latex','fontsize',60)
xticks(0:5)

% Create line
annotation('line',[0.537 0.536],[0.4625 0.895],...
    'Color',[0.650980392156863 0.650980392156863 0.650980392156863],...
    'LineWidth',3,...
    'LineStyle','--');

% Create line
annotation('line',[0.306 0.306],[0.1865 0.9175],...
    'Color',[0.650980392156863 0.650980392156863 0.650980392156863],...
    'LineWidth',3,...
    'LineStyle','--');

% Create textbox
annotation('textbox',[0.233 0.8315 0.0829999999999999 0.0875],...
    'String','(f)',...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',50,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','off');

print('Ct_0p66','-depsc')


figure('Position',[900 200 1000 800]);
hold on
box on
plot(dataC(1:100,1)/3,dataC(1:100,2),'r-','linewidth',3)
plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
plot(dataC(:,1)/sqrt(3),dataC(:,4),'k-','linewidth',3)
plot(dataC(1:80,1)/9,dataC(1:80,5),'g-','linewidth',3)
plot(dataC(1:100,1)/6,dataC(1:100,6),'m-','linewidth',3)


set(gca,'FontSize',40,'LineWidth',2,'xlim',[0,5],'ylim',[0,1])
xlabel('$t\alpha$','interpreter','latex','fontsize',60)
ylabel('$C(t)$','interpreter','latex','fontsize',60)


figure('Position',[900 200 1000 800]);
hold on
box on

dim = 10;

plot(1:dim,1 + 2*(1:dim),'r-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,(1:dim).^(2/3),'b-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,sqrt(1 + 2*(1:dim).^2),'k-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,(1 + 2*sqrt(1:dim)).^2,'g-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,1 + 3*(1:dim).^(2/3) + 2*(1:dim),'m-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')


set(gca,'FontSize',50,'LineWidth',2)
xlabel('$n$','interpreter','latex','fontsize',60)
ylabel('$b_n/\alpha$','interpreter','latex','fontsize',60)

leg = legend('$1+2n$','$n^{2/3}$','$\sqrt{1+2n^2}$','$(1+2\sqrt{n})^{2}$',...
    '$1+3n^{2/3}+2n$');
set(leg,'location','northwest','Interpreter','latex');


% Create textbox
annotation('textbox',[0.815 0.82775 0.083 0.0875],'String',{'(e)'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',50,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','off');

print('bn_0p66','-depsc')

%%

clear;

dataC = load('Universality_0p9_of_autocorrelation.txt');

figure('Position',[900 200 1000 800]);
hold on
box on

plot(dataC(:,1),dataC(:,2),'r-','linewidth',3)
plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
plot(dataC(:,1),dataC(:,4),'k-','linewidth',3)


set(gca,'FontSize',50,'LineWidth',2,'xlim',[0,5],'ylim',[0,1])
xlabel('$tb_1$','interpreter','latex','fontsize',60)
ylabel('$C(t)$','interpreter','latex','fontsize',60)
yticks(0:0.2:1)

annotation('textbox',...
    [0.165 0.190561412811279 0.184 0.127188587188721],...
    'String',{'$\frac{b''(1)}{b(1)}=\frac{2}{3}$'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',60,...
    'FontName','Helvetica Neue');

axes('Position',[0.447 0.4575 0.451 0.44625]);
hold on
box on

plot(dataC(1:82,1)/10,dataC(1:82,2),'r-','linewidth',3)
plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
plot(dataC(1:78,1)/sqrt(10),dataC(1:78,4),'k-','linewidth',3)


set(gca,'FontSize',40,'LineWidth',2,'xlim',[0,5])
xlabel('$t\alpha$','interpreter','latex','fontsize',60)
xticks(0:5)

% Create line
annotation('line',[0.537 0.536],[0.4625 0.895],...
    'Color',[0.650980392156863 0.650980392156863 0.650980392156863],...
    'LineWidth',3,...
    'LineStyle','--');

% Create line
annotation('line',[0.306 0.306],[0.1865 0.9175],...
    'Color',[0.650980392156863 0.650980392156863 0.650980392156863],...
    'LineWidth',3,...
    'LineStyle','--');

% Create textbox
annotation('textbox',[0.233 0.8315 0.0829999999999999 0.0875],...
    'String','(f)',...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',50,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','off');

print('Ct_0p9','-depsc')


figure('Position',[900 200 1000 800]);
hold on
box on
plot(dataC(1:82,1)/10,dataC(1:82,2),'r-','linewidth',3)
plot(dataC(:,1),dataC(:,3),'b-','linewidth',3)
plot(dataC(1:77,1)/sqrt(10),dataC(1:77,4),'k-','linewidth',3)


set(gca,'FontSize',40,'LineWidth',2,'xlim',[0,5],'ylim',[0,1])
xlabel('$t\alpha$','interpreter','latex','fontsize',60)
ylabel('$C(t)$','interpreter','latex','fontsize',60)


figure('Position',[900 200 1000 800]);
hold on
box on

dim = 10;

plot(1:dim,1 + 9*(1:dim),'r-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,(1:dim).^(9/10),'b-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')
plot(1:dim,sqrt(1 + 9*(1:dim).^2),'k-','linewidth',2,'MarkerSize',15,'Marker','o','LineStyle','none')


set(gca,'FontSize',50,'LineWidth',2)
xlabel('$n$','interpreter','latex','fontsize',60)
ylabel('$b_n/\alpha$','interpreter','latex','fontsize',60)

leg = legend('$1+9n$','$n^{9/10}$','$\sqrt{1+9n^2}$');
set(leg,'location','northwest','Interpreter','latex');


% Create textbox
annotation('textbox',[0.815 0.82775 0.083 0.0875],'String',{'(e)'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',50,...
    'FontName','Helvetica Neue',...
    'FitBoxToText','off');

print('bn_0p9','-depsc')




