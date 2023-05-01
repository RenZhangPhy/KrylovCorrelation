
function TLIsing_bn_Oyy(h,g,site)

sigmax = [0,1;1,0];
sigmay = [0,-1i;1i,0];
sigmaz = [1,0;0,-1];
identiy = [1,0;0,1];

H1 = zeros(2^site,2^site);
H2 = zeros(2^site,2^site);
H3 = zeros(2^site,2^site);

%%
for l = 1:site - 1

    Arr = repmat(identiy,1,site);

    Arr(:,2*l - 1:2*l) = sigmaz;
    Arr(:,2*l + 1:2*l + 2) = sigmaz;

    h1 = 1;
    for n = 1:site

        h1 = kron(h1,Arr(:,2*n - 1:2*n));

    end
    H1 = H1 + h1;

end
% Up to now, we have the open boundary condition

Arr = repmat(identiy,1,site);

Arr(:,1:2) = sigmaz;
Arr(:,2*site - 1:2*site) = sigmaz;

h1 = 1;
for n = 1:site

    h1 = kron(h1,Arr(:,2*n - 1:2*n));

end

% Up to now, we have the periodic boundary condition

H1 = H1 + h1;

%%

for l = 1:site

    Arr = repmat(identiy,1,site);

    Arr(:,2*l - 1:2*l) = sigmax;

    h2 = 1;
    for n = 1:site

        h2 = kron(h2,Arr(:,2*n - 1:2*n));

    end
    H2 = H2 + h2;

end

H2 = h*H2;

% In this part, we give the Hamiltonian of the transverse field.

%%

for l = 1:site

    Arr = repmat(identiy,1,site);

    Arr(:,2*l - 1:2*l) = sigmaz;

    h3 = 1;
    for n = 1:site

        h3 = kron(h3,Arr(:,2*n - 1:2*n));

    end
    H3 = H3 + h3;

end

H3 = g*H3;

% In this part, we give the Hamiltonian of the longitutial field.

%%
H = H1 + H2 + H3;
% This is the total Hamiltonian
%%
Arr = repmat(identiy,1,site);

midsite = floor(site/2);% 算符处于中心格点

Arr(:,2*midsite + 1:2*midsite + 2) = sigmay;
Arr(:,2*midsite + 3:2*midsite + 4) = sigmay;

s = 1;
for n = 1:site

    s = kron(s,Arr(:,2*n - 1:2*n));

end
% This is the operator


%%
tic
b0 = 1/sqrt(trace(s.'*s));
O0 = b0*s;
A1 = H*O0 - O0*H;
b1 = sqrt(trace(A1.'*A1));
O1 = A1/b1;

bnnum = 50;
bn = zeros(1,bnnum);
bn(1) = b1;


On2 = O0;
On1 = O1;

fid = fopen(['bn_Oyy_site=',num2str(site),'_O_loc=',num2str(midsite),'_h=',num2str(h),'_g=',num2str(g),'.txt'],'wt');
fprintf(fid,'%4.2f %4.6f\n',1,b1);

for n = 2:bnnum

    A = H*On1 - On1*H - bn(n - 1)*On2;
    bn(n) = sqrt(trace(A.'*A));
    On2 = On1;
    On1 = A/bn(n);
    fprintf(fid,'%4.2f %4.6f\n',n,bn(n));

end
toc
%%

% figure('Position',[900 200 1000 800]);
% hold on
% box on
% 
% plot(bn,'MarkerFaceColor','r','MarkerSize',10,'Marker','o','LineWidth',0.1,'LineStyle','-','Color','r')
% 
% set(gca,'FontSize',40,'LineWidth',2)
% xlabel('$n$','interpreter','latex','fontsize',50)
% ylabel('$b_n$','interpreter','latex','fontsize',40)
end
