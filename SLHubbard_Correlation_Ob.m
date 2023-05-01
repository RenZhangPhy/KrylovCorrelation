function SLHubbard_Correlation_Ob(J,V1,V2,site)

sigmap = [0,1;0,0];
sigmam = [0,0;1,0];
sigmapm = [1,0;0,0];
esigma = [-1,0;0,1];
identiy = [1,0;0,1];

% site = 10;
dim = 2^site;
H1 = zeros(dim,dim);
H2 = zeros(dim,dim);
H3 = zeros(dim,dim);
H4 = zeros(dim,dim);

%%
% 这里给出近邻跃迁的哈密顿量
for l = 1:site - 1

    Arr = repmat(identiy,1,site);

    Arr(:,2*l - 1:2*l) = sigmap*esigma;
    Arr(:,2*l + 1:2*l + 2) = sigmam;

    h1 = 1;
    for n = 1:site

        h1 = kron(h1,Arr(:,2*n - 1:2*n));

    end
    H1 = H1 + h1;

end

% Up to now, we have the open boundary condition 

Arr = repmat(esigma,1,site);%注意!!!这里的边界条件要乘以一串e^(-i*sigma^+sigma^-)

Arr(:,2*site - 1:2*site) = sigmap;
Arr(:,1:2) = esigma*sigmam;

h1 = 1;
for n = 1:site

    h1 = kron(h1,Arr(:,2*n - 1:2*n));

end

H1 = H1 + h1;
% Up to now, we have the periodic boundary condition

%%
% 这里给出次近邻跃迁的哈密顿量

if J~=0
    for l = 1:site - 2

        Arr = repmat(identiy,1,site);
    
        Arr(:,2*l - 1:2*l) = sigmap*esigma;
        Arr(:,2*l + 1:2*l + 2) = esigma;
        Arr(:,2*l + 3:2*l + 4) = sigmam;
    
        h2 = 1;
        for n = 1:site
    
            h2 = kron(h2,Arr(:,2*n - 1:2*n));
    
        end
        H2 = H2 + h2;

    end

% Up to now, we have the open boundary condition 

    Arr = repmat(esigma,1,site);%注意!!!这里的边界条件要乘以一串e^(-i*sigma^+sigma^-)
    
    Arr(:,2*site - 3:2*site - 2) = sigmap;
    Arr(:,2*site - 1:2*site) = identiy;
    Arr(:,1:2) = esigma*sigmam;
    
    h2 = 1;
    for n = 1:site
    
        h2 = kron(h2,Arr(:,2*n - 1:2*n));
    
    end
    
    H2 = H2 + h2;
%******
    Arr = repmat(esigma,1,site);%注意!!!这里的边界条件要乘以一串e^(-i*sigma^+sigma^-)
    
    Arr(:,2*site - 1:2*site) = sigmap;
    Arr(:,1:2) = identiy;
    Arr(:,3:4) = esigma*sigmam;
    
    h2 = 1;
    for n = 1:site
    
        h2 = kron(h2,Arr(:,2*n - 1:2*n));
    
    end
    
    H2 = H2 + h2;
    % Up to now, we have the periodic boundary condition

end
H2 = J*H2;


%%
% 这里给出近邻相互作用的哈密顿量
for l = 1:site - 1

    Arr = repmat(identiy,1,site);

    Arr(:,2*l - 1:2*l) = sigmapm;
    Arr(:,2*l + 1:2*l + 2) = sigmapm;

    h3 = 1;
    for n = 1:site

        h3 = kron(h3,Arr(:,2*n - 1:2*n));

    end
    H3 = H3 + h3;

end

% Up to now, we have the open boundary condition 

Arr = repmat(identiy,1,site);

Arr(:,2*site - 1:2*site) = sigmapm;
Arr(:,1:2) = sigmapm;

h3 = 1;
for n = 1:site

    h3 = kron(h3,Arr(:,2*n - 1:2*n));

end
H3 = H3 + h3;
% Up to now, we have the periodic boundary condition

H3 = V1*H3;

%%
% 这里给出次近邻相互作用的哈密顿量

if V2 ~= 0
    for l = 1:site - 2

        Arr = repmat(identiy,1,site);
    
        Arr(:,2*l - 1:2*l) = sigmapm;
        Arr(:,2*l + 3:2*l + 4) = sigmapm;
    
        h4 = 1;
        for n = 1:site
    
            h4 = kron(h4,Arr(:,2*n - 1:2*n));
    
        end
        H4 = H4 + h4;

    end

% Up to now, we have the open boundary condition 

    Arr = repmat(identiy,1,site);
    
    Arr(:,2*site - 3:2*site - 2) = sigmapm;
    Arr(:,1:2) = sigmapm;
    
    h4 = 1;
    for n = 1:site
    
        h4 = kron(h4,Arr(:,2*n - 1:2*n));
    
    end
    
    H4 = H4 + h4;
%******
    Arr = repmat(identiy,1,site);
    
    Arr(:,2*site - 1:2*site) = sigmapm;
    Arr(:,3:4) = sigmapm;
    
    h4 = 1;
    for n = 1:site
    
        h4 = kron(h4,Arr(:,2*n - 1:2*n));
    
    end
    
    H4 = H4 + h4;
    % Up to now, we have the periodic boundary condition

end

H4 = V2*H4;

%%
H = - H1 - H1' - H2 - H2' + H3 + H4;
% This is the total Hamiltonian
%%
% 这里给出待演化的算符 2*n1 - 1
Arr = repmat(identiy,1,site);

Arr(:,1:2) = 2*sigmapm - identiy; %算符为玻色型无迹算符

s = 1;
for n = 1:site

    s = kron(s,Arr(:,2*n - 1:2*n));

end


%%
% 
fid = fopen(['Hubbard_Corr_Ob_site=',num2str(site),'_J=',num2str(J),'_V1=',num2str(V1),'_V2=',num2str(V2),'.txt'],'wt');
tmax = 5;
tnum = 50;
tarry = linspace(0,tmax,tnum);
Corr = zeros(1,tnum);

%
tic
[V,D] = eig(H);% H 是实对称矩阵，因此，特征值和特征向量均为实的。

sV = V'*s*V; % 因为V是实的，所以V'就是V的转置。
for n = 1:tnum
    
    t = tarry(n);
    U = expm(1i*D*t);
    VU = V*U;
    st = VU*sV*(VU)'; % D为对角的，因此(VU)'=conj(U)*V'。
    Corr(n) = trace(s'*st);

    fprintf(fid,'%4.6f %4.6f\n',t,Corr(n)/dim);

end
toc

% figure('Position',[900 200 1000 800]);
% hold on
% box on
% plot(tarry,real(Corr)/dim,'r-','linewidth',2)
% 
% set(gca,'FontSize',40,'LineWidth',2)
% xlabel('$tJ$','interpreter','latex','fontsize',50)
% ylabel('$C(t)$','interpreter','latex','fontsize',40)

end
