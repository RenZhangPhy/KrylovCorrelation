
function TLIsing_Correlation_Oz(h,g,site)

sigmax = [0,1;1,0];
sigmaz = [1,0;0,-1];
identiy = [1,0;0,1];

dim = 2^site;
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

Arr(:,2*midsite + 1:2*midsite + 2) = sigmaz;

s = 1;
for n = 1:site

    s = kron(s,Arr(:,2*n - 1:2*n));

end



%%

fid = fopen(['Correlation_Oz_site=',num2str(site),'_O_loc=',num2str(midsite),'_h=',num2str(h),'_g=',num2str(g),'.txt'],'wt');

tmax = 5;
tnum = 100;
tarry = linspace(0,tmax,tnum);
Corr = zeros(1,tnum);

[V,D] = eig(H);% H 是实对称矩阵，因此，特征值和特征向量均为实的。

sV = V'*s*V; % 因为V是实的，所以V'就是V的转置。

tic % 计算这个循环耗时
for n = 1:tnum
    
    t = tarry(n);
    U = expm(1i*D*t);
    VU = V*U;
    st = VU*sV*(VU)'; % D为对角的，因此(VU)'=conj(U)*V'。
    Corr(n) = trace(s'*st)/dim;

    fprintf(fid,'%4.6f %4.6f\n',t,Corr(n));

end
toc

% figure('Position',[900 200 1000 800]);
% hold on
% box on
% 
% plot(tarry,Corr,'r-','linewidth',2)
% 
% set(gca,'FontSize',40,'LineWidth',2)
% xlabel('$tJ$','interpreter','latex','fontsize',50)
% ylabel('$C(t)$','interpreter','latex','fontsize',40)
end

